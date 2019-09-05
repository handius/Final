package com.bitcamp.comm;

/**
 * 보색 계산기
 */
public class ComplementaryColor {
	
	private ComplementaryColor() {};
	
	/**
	 * #ffffff형태로 넣어주세요(길이 상관 X)
	 */
	public static String complementaryColorConverter(String hexColor) {
		
		if(!hexColor.contains("#")) {
			hexColor = "#"+hexColor;
		}
		
		String[] hexColorArr = hexColor.split("");
		String resultColor = "#";
		for(int i=1; i<hexColorArr.length; i++) {
			resultColor += hexToIntConverter(15-hexToIntConverter(hexColorArr[i]));
		}
		
		return resultColor;
	}
	
	/**
	 * 16진법 1개 문자 10진법 정수 변환
	 */
	private static int hexToIntConverter(String hexWord) {
		int converterResult = 0;
		if(hexWord.equals("f")) {
			converterResult = 15;
		}
		else if(hexWord.equals("e")) {
			converterResult = 14;
		}
		else if(hexWord.equals("d")) {
			converterResult = 13;
		}
		else if(hexWord.equals("c")) {
			converterResult = 12;
		}
		else if(hexWord.equals("b")) {
			converterResult = 11;
		}
		else if(hexWord.equals("a")) {
			converterResult = 10;
		}
		else {
			converterResult = Integer.parseInt(hexWord);
		}
		return converterResult;
	}
	
	/**
	 * 10진법 1개 정수 16진법 문자 변환
	 */
	private static String hexToIntConverter(int intWord) {
		String converterResult = "";
		if(intWord == 15 ) {
			converterResult = "f";
		}
		else if(intWord == 14 ) {
			converterResult = "e";
		}
		else if(intWord == 13 ) {
			converterResult = "d";
		}
		else if(intWord == 12 ) {
			converterResult = "b";
		}
		else if(intWord == 11 ) {
			converterResult = "c";
		}
		else if(intWord == 10 ) {
			converterResult = "a";
		}
		else {
			converterResult = Integer.toString(intWord);
		}
		return converterResult;
	}
}
