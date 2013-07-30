package com.country;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * 
 */

/**
 * Este programa formara el script correspondiente para generar generar la base
 * 
 * @author kaloye
 * 
 */
public class GenerarEsquema {

	private final static String DIR_NAME_PROJECT = "C:\\wsCountry\\countryDB\\";
	private final static String FILE_NAME_SCRIPT = "cuntryBD.sql"; 
	private final static String FOLDER_NAME_SCHEMA = "schema";			
	private final static String FOLDER_NAME_TABLES = "tables";
			
	
	/**
	 * @param args
	 */
	public static void main(String[] args) {

		File script = new File (DIR_NAME_PROJECT+FILE_NAME_SCRIPT);
		createNewFile(script);
		
		adherirDirectorios(script, DIR_NAME_PROJECT + FOLDER_NAME_SCHEMA);
		adherirDirectorios(script, DIR_NAME_PROJECT + FOLDER_NAME_TABLES);

	}
	
	public static void adherirDirectorios(File script,String sDirectorio){
		File f = new File(sDirectorio);
		FileReader fr = null;
		
		if (f.exists()) {
			File[] ficheros = f.listFiles();
			for (int x = 0; x < ficheros.length; x++) {
				System.out.println(ficheros[x].getName());
				List<String> lines = readFile(f.getPath() + "\\" + ficheros[x].getName(), f, fr);
				writeFile(script, lines);
			}
		} else {
			System.out.println("no existe el directorio");
		}
	}

	public static void createNewFile(File f){
		f.delete();
		try {
		  f.createNewFile();
		} catch (IOException ioe) {
		  ioe.printStackTrace();
		}
		
	}

	public static BufferedReader openFile(String filename, File file,
			FileReader fr) {
		BufferedReader br = null;
		try {
			file = new File(filename);
			fr = new FileReader(file);
			br = new BufferedReader(fr);
		} catch (Exception ex) {
			System.out.println(ex);
		}
		return br;
	}

	public static void closeFile(FileReader fr) {
		try {
			if (fr != null)
				fr.close();
			System.gc();// llamada a garbage collector
		} catch (Exception ex) {
		}
	}

	// lectura de archivo
	private static List<String> readFile(String filename, File file,
			FileReader fr) {
		List<String> lines = new ArrayList<String>();
		
		String line = "";
		try {
			BufferedReader br = openFile(filename, file, fr);

			if (br != null) {
				while ((line = br.readLine()) != null) {
					lines.add(line);// agregamos las lineas de texto en la lista de lineas
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			closeFile(fr);
		}
		return lines;
	}
	
	private static void writeFile(File file,	List<String> lista) {
		//openFile
		FileWriter fw;
		try {
			fw = new FileWriter(file,true);
			BufferedWriter bw = new BufferedWriter(fw);
			
			for (String linea: lista) {
				bw.append(linea+ "\n");
			}
			bw.append("\n");
			
			bw.close();
			fw.close();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	
	
}