package utils;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;

public class Imagenes {
	public static byte[] ImageToByte(File file) throws FileNotFoundException {
		FileInputStream fis = new FileInputStream(file);
		ByteArrayOutputStream bos = new ByteArrayOutputStream();
		byte[] buf = new byte[1024];

		try {
			for (int readNum; (readNum = fis.read(buf)) != -1;) {
				bos.write(buf, 0, readNum);
			}
		} catch (Exception e) {
			// TODO: handle exception
			System.out.println(e);
		}
		byte[] bytes = bos.toByteArray();

		return bytes;
	}

}
