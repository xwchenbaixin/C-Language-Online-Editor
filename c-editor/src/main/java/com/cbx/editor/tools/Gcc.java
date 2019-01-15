package com.cbx.editor.tools;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.TimeUnit;

import com.cbx.editor.beans.Constants;
import com.cbx.editor.beans.Editor;

public class Gcc {
	public String output = "";
	public String error = "";
	public long runtime;
	public StringBuilder sb;
	public Process p;
	public Runtime run;
	public ProcessBuilder pb;
	public Editor editor;
	public String code;
	public double score;
	public String dir;
	public String filename;
	public String filepath;
	public String params;
	public Gcc(Editor editor) {
		this.code=editor.getCode();
		this.editor=editor;
		this.params=editor.getParams();
		this.dir=Constants.EDITOR_OUT_DIR;
		this.pb=new ProcessBuilder(); 
		File file =new File(this.dir);
		if(!file.isDirectory())
			file.mkdir();
		this.filename=UUID.randomUUID().toString();
		this.filepath=dir+filename;
		run = Runtime.getRuntime();
	}
	
	public Map<String, Object> run(){
		Map<String, Object> res = new HashMap<>();
		pb.redirectErrorStream(true); 
		try {
			// ---------------------------------------创建文件
			File file = new File(filepath+".c");
			FileWriter fw = new FileWriter(file);
			fw.write(code);
			fw.close();
			// ---------------------------------------编译
			//获取编译错误
			compile();
			file.delete();
			//若是有编译错误则返回
			if(error.length()>0) {
				error=error.replaceAll(filepath+".c:", "");
				res.put("output", output);
				res.put("error", error);
				res.put("runtime",runtime);
				return res;
			}
			// ---------------------------------------运行
			//do something
				//p=pb.command(filepath+".exe",params).start();
			getResult();
			
			if(output.equals("(null)\r\n"))
				output="";
			res.put("output", output);
			res.put("error", error);
			res.put("runtime",runtime);
			file=new File(filepath+".exe");
			System.gc();
			if(file.delete())
				System.out.println("删除文件成功："+filepath+".exe");
			else
				System.out.println("删除文件失败："+filepath+".exe");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	public void getResult() {
		//写入数据
		try {
			long startTime = System.currentTimeMillis(); 
			if(params!=null)
				p=pb.command(filepath+".exe",params).start();
			else
				p=pb.command(filepath+".exe").start();
			new Thread() {
				@Override
				public void run() {
					try {
						if(params!=null) {
							OutputStream output=p.getOutputStream();
							output.write(params.getBytes());
							output.flush();
							output.close();
						}	
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}  
				}
			}.start();
			
			//读取数据
			new Thread() {
				@Override
				public void run() {
					BufferedReader inputReader = new BufferedReader(new InputStreamReader(p.getInputStream()));
					System.out.println("开始读取");
					sb=new StringBuilder();
					try {
						for (int line; -1!= (line = inputReader.read());) {
							sb.append((char)line);
						}
					} catch (IOException e) {
						// TODO Auto-generated catch block
						System.out.println("程序超时,inputStream中止");
					}finally {
						System.out.println("读取结束");
					}
				}
			}.start();
			//超时检测
			p.waitFor(Constants.RUNTIME, TimeUnit.MILLISECONDS);
			
			long endTime = System.currentTimeMillis();
			
			p.destroy();
			
			System.out.println("销毁进程,关闭IO流");
			runtime=endTime - startTime;
			System.out.println(runtime);
			if(runtime>Constants.RUNTIME) {
				runtime=Constants.RUNTIME;
				error="timeOut!";
			}
			else
				output=sb.toString();
			
		} catch (InterruptedException e) {
			// TODO Auto-generated catch block
			p.destroy();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void compile() {
		try {
			p = pb.command("gcc",filepath+".c","-o",filepath+".exe").start();
			new Thread() {
				@Override
				public void run() {
					try {
						BufferedReader errorInfo = new BufferedReader(new InputStreamReader(p.getInputStream()));
						for (String line; null != (line = errorInfo.readLine());) {
							System.out.println(line);
							error += line + "\r\n";
						}
						errorInfo.close();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}finally {
						try {
							p.getInputStream().close();
							p.getErrorStream().close();
							p.getOutputStream().close();
						} catch (IOException e1) {
							// TODO Auto-generated catch block
							e1.printStackTrace();
						}
					}
				}
			}.start();
			p.waitFor();
			p.destroy();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}catch (InterruptedException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
