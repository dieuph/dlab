package ctu.edu.vn.dlab.common;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.jboss.logging.Logger;


public class DateTimeFormatImpl {
	
	private static final String DATE_PATTERN = "dd-MM-yyyy";
	private static final String TIME_PATTERN = "HH:mm:ss";
	private static final String JOIN_DATE_TIME_PATTERN = "dd-MM-yyyy hh:mm a";
	private static final String DEFAULT_PATTERN = "yyyy-MM-dd HH:mm:ss";
	
	public static String getDateFromString(String text) {
		SimpleDateFormat sdf = new SimpleDateFormat(DEFAULT_PATTERN);
		Date date = null;
		try {
			date = sdf.parse(text);
		} catch (ParseException e) {
			_log.error("ctu.edu.vn.dlab.common.DateTimeFormatImpl - Error. string to date-string");
			e.printStackTrace();
		}
		sdf = new SimpleDateFormat(DATE_PATTERN);
		return sdf.format(date);
	}
	
	public static String getTimeFromString(String text) {
		SimpleDateFormat sdf = new SimpleDateFormat(DEFAULT_PATTERN);
		Date time = null;
		try {
			time = sdf.parse(text);
		} catch (ParseException e) {
			_log.error("ctu.edu.vn.dlab.common.DateTimeFormatImpl - Error. string to time-string");
			e.printStackTrace();
		}
		sdf = new SimpleDateFormat(TIME_PATTERN);
		return sdf.format(time);
	}
	
	public static String getDateFromDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(DATE_PATTERN);
		return sdf.format(date);
	}
	
	public static String getTimeFromDate(Date date) {
		SimpleDateFormat sdf = new SimpleDateFormat(TIME_PATTERN);
		return sdf.format(date);
	}
	
	public static Date getJoinDateTime(String date, String time) {
		SimpleDateFormat sdf = new SimpleDateFormat(JOIN_DATE_TIME_PATTERN);
		Date datetime = null;
		try {
			datetime = sdf.parse(date + " " + time);
		} catch (Exception e) {
			_log.error("ctu.edu.vn.dlab.common.DateTimeFormatImpl - Error. date time string to Date object");
			e.printStackTrace();
		}
		return datetime;
	}
	
	private static final Logger _log = Logger.getLogger(DateTimeFormatImpl.class);
}
