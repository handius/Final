package com.bitcamp.comm;

public class ScrollCalculation {
	private int currentPage; //현재 페이지 값
	private int sizeSql;     //sql 크기
	public int startSql;    //sql 시작 값
	public int endSql;      //sql 끝 값
	private int maxSql;      //sql 최대 값
	public boolean active = true;  //작동여부 판단.
	
	/**
	 * 현재 페이지 값, sql 크기, sql 최대 값을 입력
	 */
	public ScrollCalculation(int currentPage, int sizeSql, int maxSql) {
		this.currentPage = currentPage;
		this.sizeSql= sizeSql;
		this.maxSql = maxSql;
		
		Calculation();
	}
	
	//내부 계산 함수
	private void Calculation() {
		
		int tmpstartSql = (currentPage - 1) * sizeSql + 1;
		int tmpendSql = tmpstartSql + sizeSql - 1;
		
		//정상 범위 계산
		if(tmpstartSql <= maxSql) {
			startSql = tmpstartSql;
			endSql = tmpendSql;
			
			if(endSql > maxSql) {
				endSql = maxSql;
			}
		}
		else {
			active = false;
		}
	}

	public int getStartSql() {
		return startSql;
	}

	public int getEndSql() {
		return endSql;
	}

	public boolean isActive() {
		return active;
	}
}
