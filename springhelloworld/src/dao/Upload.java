package dao;

public class Upload {
private int id;
private String path;
private String description;
public Upload()
{
	
}
public Upload(String path,String description)
{
	this.description=description;
	this.path=path;
}
public int getId() {
	return id;
}
public void setId(int id) {
	this.id = id;
}
public String getPath() {
	return path;
}
public void setPath(String path) {
	this.path = path;
}
public String getDescription() {
	return description;
}
public void setDescription(String description) {
	this.description = description;
}



}
