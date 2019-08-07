package com.bitcamp.DTO.order;

import java.util.List;

public class OrderDTO {
	private int order_no;
	private int list_no;
	private int member_no;
	private int order_price;
	private List<Integer> order_add_option;
	private List<String> option_name;
	private List<Integer> order_amount;
	private List<Integer> option_price;
	private String order_date;
	private String order_status;
	private List<Integer> ordermade_no;
	private int artist_no;
	private List<Integer> list_order_no;
	private List<String> order_value;

	private String list_title;

	public int getOrder_no() {
		return order_no;
	}

	public void setOrder_no(int order_no) {
		this.order_no = order_no;
	}

	public int getList_no() {
		return list_no;
	}

	public void setList_no(int list_no) {
		this.list_no = list_no;
	}

	public int getMember_no() {
		return member_no;
	}

	public void setMember_no(int member_no) {
		this.member_no = member_no;
	}

	public int getOrder_price() {
		return order_price;
	}

	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}

	public List<Integer> getOrder_add_option() {
		return order_add_option;
	}

	public void setOrder_add_option(List<Integer> order_add_option) {
		this.order_add_option = order_add_option;
	}

	public List<String> getOption_name() {
		return option_name;
	}

	public void setOption_name(List<String> option_name) {
		this.option_name = option_name;
	}

	public List<Integer> getOrder_amount() {
		return order_amount;
	}

	public void setOrder_amount(List<Integer> order_amount) {
		this.order_amount = order_amount;
	}

	public List<Integer> getOption_price() {
		return option_price;
	}

	public void setOption_price(List<Integer> option_price) {
		this.option_price = option_price;
	}

	public String getOrder_date() {
		return order_date;
	}

	public void setOrder_date(String order_date) {
		this.order_date = order_date;
	}

	public String getOrder_status() {
		return order_status;
	}

	public void setOrder_status(String order_status) {
		this.order_status = order_status;
	}

	public List<Integer> getOrdermade_no() {
		return ordermade_no;
	}

	public void setOrdermade_no(List<Integer> ordermade_no) {
		this.ordermade_no = ordermade_no;
	}

	public int getArtist_no() {
		return artist_no;
	}

	public void setArtist_no(int artist_no) {
		this.artist_no = artist_no;
	}

	public List<Integer> getList_order_no() {
		return list_order_no;
	}

	public void setList_order_no(List<Integer> list_order_no) {
		this.list_order_no = list_order_no;
	}

	public List<String> getOrder_value() {
		return order_value;
	}

	public void setOrder_value(List<String> order_value) {
		this.order_value = order_value;
	}

	public String getList_title() {
		return list_title;
	}

	public void setList_title(String list_title) {
		this.list_title = list_title;
	}
}
