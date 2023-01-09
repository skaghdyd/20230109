package nhy_java.notice;

public class NoticeDto {
	private int idx; // 글번호
	private String author; // 작성자
	private String title; // 제목
	private String content; // 내용
	private String fileName; // 첨부파일명
	private String createDate; // 작성일
	private int hit; // 조회수

	public NoticeDto(int idx, String author, String title, String content, String fileName, String createDate,
			int hit) {
		super();
		this.idx = idx;
		this.author = author;
		this.title = title;
		this.content = content;
		this.fileName = fileName;
		this.createDate = createDate;
		this.hit = hit;
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

	public String getFileName() {
		return fileName;
	}

	public void setFileName(String fileName) {
		this.fileName = fileName;
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

	@Override
	public String toString() {
		return "NoticeDto [idx=" + idx + ", author=" + author + ", title=" + title + ", content=" + content
				+ ", fileName=" + fileName + ", createDate=" + createDate + ", hit=" + hit + "]";
	}
}
