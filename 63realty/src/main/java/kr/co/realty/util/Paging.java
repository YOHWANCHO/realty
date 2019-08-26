package kr.co.realty.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;

@Component("paging")
public class Paging {
	
	private static final Logger logger = LoggerFactory.getLogger(Paging.class);
	
	private final int DEFAULT_PAGING_INDEX = 1 ;
	private final int DEFAULT_PAGING_SIZE = 10 ; // page count
	private final int DEFAULT_PAGING_COUNT = 10; //1 page per row count 

	private int pageCount=0;
	private int pageSize=0; 
	private int firstPageIndex; 
	private int prevPageIndex; 
	private int startPageIndex; 
	private int pageIndex=1; 
	private int endPageIndex; 
	private int nextPageIndex; 
	private int finalPageIndex; 
	private int totalCount; 

	
	public void printPageProperty(){
		logger.info("pageCount:"+this.pageCount );
		logger.info("pageSize:"+this.pageSize );
		logger.info("firstPageIndx:"+this.firstPageIndex );
		logger.info("prevPageIndex:"+this.prevPageIndex);
		logger.info("startPageIndex:"+this.startPageIndex );
		logger.info("pageIndex:"+this.pageIndex );
		logger.info("endPageIndex:"+this.endPageIndex );
		logger.info("nextPageIndex:"+this.nextPageIndex );
		logger.info("finalPageIndex:"+this.finalPageIndex );
		logger.info("totalCount:"+this.totalCount );
	}
	
	public int getPageSize() {
		return pageSize;
	}
	public int getFirstPageIndex() {
		return firstPageIndex;
	}
	public int getPrevPageIndex() {
		return prevPageIndex;
	}
	public int getStartPageIndex() {
		return startPageIndex;
	}
	public int getPageIndex() {
		return pageIndex;
	}
	public int getEndPageIndex() {
		return endPageIndex;
	}
	public int getNextPageIndex() {
		return nextPageIndex;
	}
	public int getFinalPageIndex() {
		return finalPageIndex;
	}
	public int getTotalCount() {
		return totalCount;
	}
	public int getPageCount() {
		return pageCount;
	}

	public void setPageCount(int pageCount) {
		this.pageCount = pageCount;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public void setFirstPageIndex(int firstPageIndex) {
		this.firstPageIndex = firstPageIndex;
	}
	public void setPrevPageIndex(int prevPageIndex) {
		this.prevPageIndex = prevPageIndex;
	}
	public void setStartPageIndex(int startPageIndex) {
		this.startPageIndex = startPageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public void setEndPageIndex(int endPageIndex) {
		this.endPageIndex = endPageIndex;
	}
	public void setNextPageIndex(int nextPageIndex) {
		this.nextPageIndex = nextPageIndex;
	}
	public void setFinalPageIndex(int finalPageIndex) {
		this.finalPageIndex = finalPageIndex;
	}
	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
		makePaging();
	}
	private void makePaging() {
		if (this.totalCount == 0) return; 
		if (this.pageCount ==0) this.setPageCount(DEFAULT_PAGING_COUNT);
		if (this.pageIndex == 0) this.setPageIndex(DEFAULT_PAGING_INDEX); 
		if (this.pageSize == 0) this.setPageSize(DEFAULT_PAGING_SIZE); 

		
		int finalPage = (totalCount + (pageCount - 1)) / pageCount; 
		if (this.pageIndex > finalPage) this.setPageIndex(finalPage); 

		if (this.pageIndex < 0 || this.pageIndex > finalPage) this.pageIndex = 1; 

		boolean isIndexwFirst = pageIndex == 1 ? true : false; 
		boolean isIndexwFinal = pageIndex == finalPage ? true : false; 

		int startPage = ((pageIndex - 1) / this.pageSize) * this.pageSize+ 1; 
		int endPage = startPage + this.pageSize - 1; 
		if (endPage > finalPage) { 
			endPage = finalPage;
		}

		this.setFirstPageIndex(1); 

		if (isIndexwFirst) {
			this.setPrevPageIndex(1); 
		} else {
			this.setPrevPageIndex(((pageIndex - 1) < 1 ? 1 : (pageIndex - 1))); 
		}

		this.setStartPageIndex(startPage); 
		this.setEndPageIndex(endPage); 

		if (isIndexwFinal) {
			this.setNextPageIndex(finalPage); 
		} else {
			this.setNextPageIndex(((pageIndex + 1) > finalPage ? finalPage : (pageIndex + 1))); 
		}

		this.setFinalPageIndex(finalPage); 
	}
}
