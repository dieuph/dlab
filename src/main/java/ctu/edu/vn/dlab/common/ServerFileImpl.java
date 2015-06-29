package ctu.edu.vn.dlab.common;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;

import org.jboss.logging.Logger;
import org.springframework.web.multipart.MultipartFile;

public class ServerFileImpl {
	
	public static String storeFile(MultipartFile file) {
		String fileName = null;
		String filePath = null;
		if (!file.isEmpty()) {
            try {
            	byte[] bytes = file.getBytes();
            	fileName = file.getOriginalFilename();
            	
            	// Creating the directory to store file
				String rootPath = System.getProperty("catalina.home");
				File dir = new File(rootPath + File.separator + "fileUpload");
				if (!dir.exists()) {
					dir.mkdirs();
				}
				
				// Create the file on server
				File serverFile = new File(dir.getAbsolutePath() + File.separator + fileName);
				BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(serverFile));
				stream.write(bytes);
				stream.close();

				_log.info("ctu.edu.vn.dlab.controller.ServerFileImpl - "
						+ "Info. server file location=" + serverFile.getAbsolutePath());
				
                _log.info("ctu.edu.vn.dlab.controller.ServerFileImpl - "
                		+ "Info. file successfully uploaded. filename=" + fileName);
                
                filePath = serverFile.getAbsolutePath();
            } catch (Exception e) {
            	_log.error("ctu.edu.vn.dlab.controller.ServerFileImpl - "
            			+ "Error. failed to upload. filename=" + fileName + " => " + e.getMessage());
            }
        } else {
        	_log.error("ctu.edu.vn.dlab.controller.ServerFileImpl - "
        			+ "Error. failed to upload. because the file was empty. filename=" + fileName);
        }
		return filePath;
	}
	
	private static final Logger _log = Logger.getLogger(ServerFileImpl.class);
}
