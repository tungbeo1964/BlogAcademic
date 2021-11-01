/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package object;

import java.io.File;
import org.apache.commons.fileupload.FileItem;

/**
 *
 * @author TuanTDA
 */
public class FileObject {

    private String itemName;
    private FileItem fileItem;
    private File file;

    public FileObject() {
    }

    public FileObject(String itemName, FileItem fileItem, File file) {
        this.itemName = itemName;
        this.fileItem = fileItem;
        this.file = file;
    }

    public String getItemName() {
        return itemName;
    }

    public void setItemName(String itemName) {
        this.itemName = itemName;
    }

    public FileItem getFileItem() {
        return fileItem;
    }

    public void setFileItem(FileItem fileItem) {
        this.fileItem = fileItem;
    }

    public File getFile() {
        return file;
    }

    public void setFile(File file) {
        this.file = file;
    }

}
