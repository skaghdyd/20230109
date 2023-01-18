package nhy_java.notice;

public class CommentDto {
	private int notice_idx;
	private int comment_idx;
	private String author;
	private String content;
	private String createDate;
	
	public CommentDto(int notice_idx, int comment_idx, String author, String content, String createDate) {
		super();
		this.notice_idx = notice_idx;
		this.comment_idx = comment_idx;
		this.author = author;
		this.content = content;
		this.createDate = createDate;
	}

	public int getNotice_idx() {
		return notice_idx;
	}

	public void setNotice_idx(int notice_idx) {
		this.notice_idx = notice_idx;
	}

	public int getComment_idx() {
		return comment_idx;
	}

	public void setComment_idx(int comment_idx) {
		this.comment_idx = comment_idx;
	}

	public String getAuthor() {
		return author;
	}

	public void setAuthor(String author) {
		this.author = author;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getCreateDate() {
		return createDate;
	}

	public void setCreateDate(String createDate) {
		this.createDate = createDate;
	}

	@Override
	public String toString() {
		return "CommentDto [notice_idx=" + notice_idx + ", comment_idx=" + comment_idx + ", author=" + author
				+ ", content=" + content + ", createDate=" + createDate + "]";
	}

}
