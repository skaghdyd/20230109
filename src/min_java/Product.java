package min_java;

import java.io.Serializable;

public class Product implements Serializable{
	private int no;
	private int productId;	//상품 아이디
	private String pname;	//상품명
	private int unitPrice;	//상품 가격
	private String description;	//상품 설명
	private String manufacturer;	//제조사
	private String category;	//분류
	private int unitsInSock;	//재고 수량
	private String fileName;
	private String fileRealName;
	
	public Product () {};
	
	
	public Product(int no, int productId, String pname, int unitPrice, String description, String manufacturer,
			String category, int unitsInSock, String fileName, String fileRealName) {
		super();
		this.no = no;
		this.productId = productId;
		this.pname = pname;
		this.unitPrice = unitPrice;
		this.description = description;
		this.manufacturer = manufacturer;
		this.category = category;
		this.unitsInSock = unitsInSock;
		this.fileName = fileName;
		this.fileRealName = fileRealName;
	}






	public int getNo() {
		return no;
	}



	public void setNo(int no) {
		this.no = no;
	}



	public int getProductId() {
		return productId;
	}



	public void setProductId(int productId) {
		this.productId = productId;
	}



	public String getPname() {
		return pname;
	}



	public void setPname(String pname) {
		this.pname = pname;
	}



	public int getUnitPrice() {
		return unitPrice;
	}



	public void setUnitPrice(int unitPrice) {
		this.unitPrice = unitPrice;
	}



	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public String getManufacturer() {
		return manufacturer;
	}



	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}



	public String getCategory() {
		return category;
	}



	public void setCategory(String category) {
		this.category = category;
	}



	public int getUnitsInSock() {
		return unitsInSock;
	}



	public void setUnitsInSock(int unitsInSock) {
		this.unitsInSock = unitsInSock;
	}



	public String getFileName() {
		return fileName;
	}



	public void setFileName(String fileName) {
		this.fileName = fileName;
	}



	public String getFileRealName() {
		return fileRealName;
	}



	public void setFileRealName(String fileRealName) {
		this.fileRealName = fileRealName;
	}



	@Override
	public String toString() {
		return "Product [no=" + no + ", productId=" + productId + ", pname=" + pname + ", unitPrice=" + unitPrice
				+ ", description=" + description + ", manufacturer=" + manufacturer + ", category=" + category
				+ ", unitsInSock=" + unitsInSock + ", fileName=" + fileName + ", fileRealName=" + fileRealName + "]";
	} 

	
	
}