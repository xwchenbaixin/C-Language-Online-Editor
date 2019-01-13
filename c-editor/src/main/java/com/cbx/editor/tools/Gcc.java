package com.cbx.editor.tools;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintStream;
import java.util.HashMap;
import java.util.Map;
import java.util.concurrent.Callable;
import java.util.concurrent.ExecutionException;
import java.util.concurrent.Future;
import java.util.concurrent.FutureTask;
import java.util.concurrent.TimeUnit;
import java.util.concurrent.TimeoutException;

public class Gcc {
	public String output = "";
	public Process p = null;
	public Runtime run;
	public ProcessBuilder pb=new ProcessBuilder(); 
	public String code;
	public Map<String, Object> run(String code){
		this.code=code;
		Map<String, Object> res = new HashMap<>();
		
		run = Runtime.getRuntime();
		try {
			// ---------------------------------------创建文件
			File file = new File("e:/gcc_test/a.c");

			if (!file.exists())
				file.createNewFile();
			FileWriter fw = new FileWriter(file);
			fw.write(code);
			fw.close();
			// ---------------------------------------编译

			pb.redirectErrorStream(true); 
			p = pb.command("gcc","e:/gcc_test/a.c","-o","e:/gcc_test/a.exe").start();
			
			BufferedReader errorInfo = new BufferedReader(new InputStreamReader(p.getInputStream()));
			String error = "";
			for (String line; null != (line = errorInfo.readLine());) {
				System.out.println(line);
				error += line + "\r\n";
			}
			res.put("error", error);
			errorInfo.close();
			p.destroy();
			if(error.length()>0)
				return res;
			
			// ---------------------------------------运行
			//超时检测
			FutureTask<Boolean> task = new FutureTask<Boolean>(new RunExe());
			new Thread(task).start();
			try {
				//3000就是超时时间
				Boolean output = task.get(3000, TimeUnit.MILLISECONDS);
				System.out.println(output);
			} catch (InterruptedException e) {
				System.out.println("线程已经停止了");
			} catch (ExecutionException e) {
			} catch (TimeoutException e) {
				System.out.println(System.currentTimeMillis() + "线程超时了，Kill他");
				System.out.println("关闭输入流");
				p.getOutputStream().close();
				error="超时";
				task.cancel(true);
			}
			
			//获取结果
			getResult();
			p.destroy();
			if(output.equals("(null)\r\n"))
				output="";
			res.put("output", output);
			res.put("output", error);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	public void getResult() {
		BufferedReader inputReader = new BufferedReader(new InputStreamReader(p.getInputStream()));
		System.out.println("开始读取");
		try {
			for (String line; null != (line = inputReader.readLine());) {
				output += line;
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			System.out.println(output);
			System.out.println("读取结束");
			try {
				inputReader.close();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	class RunExe implements Callable<Boolean> {
		@Override
		public Boolean call() throws IOException, InterruptedException{
            p=pb.command("e:/gcc_test/a.exe").start();  
			p.waitFor();
			return true;
		}
	}

}
