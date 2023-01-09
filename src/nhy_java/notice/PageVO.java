package nhy_java.notice;

public class PageVO {
	private int currentPage; // 현재 선택한 페이지 번호
	private int postCount; // 화면에 보여지는 게시글 수
	private int totalPost; // 전체 게시글 수
	private int pagination = 5; // 화면에 보여지는 페이지네이션 개수
	private int lastPage; // 화면에 보여지는 마지막 페이지네이션 번호
	private int endPage; // 마지막 페이지
	private int firstPage; // 화면에 보여지는 첫번째 페이지네이션 번호
	boolean prev; // 이전 페이지 존재 여부
	boolean next; // 다음 페이지 존재 여부

	public PageVO(int currentPage, int postCount, int totalPost) {
		super();
		this.currentPage = currentPage;
		this.postCount = postCount;
		this.totalPost = totalPost;

		this.lastPage = (int) Math.ceil((double) this.currentPage / pagination) * pagination;
		this.firstPage = (this.lastPage/pagination-1)*pagination+1;
		this.endPage = (int) Math.ceil((double) totalPost / postCount);
		if (this.lastPage > this.endPage) {
			this.lastPage = this.endPage;
		}

		this.prev = this.firstPage > pagination; // 첫번째 페이지네이션 번호가 페이지네이션보다 크면 이전 페이지가 존재함.
		this.next = this.lastPage < this.endPage; // 마지막 페이지네이션 번호가 마지막 페이지 보다 작으면 다음 페이지가 존재함
	}

	public int getLastPage() {
		return lastPage;
	}

	public int getFirstPage() {
		return firstPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public boolean isNext() {
		return next;
	}

	@Override
	public String toString() {
		return "PageVO [currentPage=" + currentPage + ", postCount=" + postCount + ", totalPost=" + totalPost
				+ ", pagination=" + pagination + ", lastPage=" + lastPage + ", firstPage=" + firstPage + ", endPage="
				+ endPage + ", prev=" + prev + ", next=" + next + "]";
	}

	public static void main(String[] args) {
		PageVO pageVO = new PageVO(6, 10, 66);
		System.out.println(pageVO);
	}
}
