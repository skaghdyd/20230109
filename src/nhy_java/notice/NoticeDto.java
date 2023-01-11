package nhy_java.notice;

public class NoticeDto {
	private int idx; // 글번호
	private String author; // 작성자
	private String title; // 제목
	private String content; // 내용
	private String saveFileName; // 기존 첨부파일명
	private String realFileName; // 실제 서버에 저장되는 첨부파일명
	private String createDate; // 작성일
	private int hit; // 조회수
	private String modifyDate; // 수정일

	public NoticeDto(int idx, String author, String title, String content, String saveFileName, String realFileName, String createDate,
			int hit, String modifyDate) {
		super();
		this.idx = idx;
		this.author = author;
		this.title = title;
		this.content = content;
		this.saveFileName = saveFileName;
		this.realFileName = realFileName;
		this.createDate = createDate;
		this.hit = hit;
		this.modifyDate = modifyDate;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getSaveFileName() {
		return saveFileName;
	}
	
	public void setSaveFileName(String savefileName) {
		this.saveFileName = savefileName;
	}
	
	public String getRealFileName() {
		return realFileName;
	}

	public void setFileName(String realfileName) {
		this.realFileName = realfileName;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}
	
	public String getModifyDate() {
		return modifyDate;
	}

	public void setModifyDate(String modifyDate) {
		this.modifyDate = modifyDate;
	}

	@Override
	public String toString() {
		return "NoticeDto [idx=" + idx + ", author=" + author + ", title=" + title + ", content=" + content
				+ ", saveFileName=" + saveFileName + ", realFileName=" + realFileName + ", createDate=" + createDate
				+ ", hit=" + hit + ", modifyDate=" + modifyDate + "]";
	}
	
}
