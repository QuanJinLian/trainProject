package dto;

import java.sql.Timestamp;

public class QnaTrain {
	private int qseq; 
	private String subject;
	private String content;
	private String reply;
	private String id;
	private String rep;
	private Timestamp indate;
	private String rep_id;
	public int getQseq() {
		return qseq;
	}
	public QnaTrain setQseq(int qseq) {
		this.qseq = qseq;
		return this;
	}
	public String getSubject() {
		return subject;
	}
	public QnaTrain setSubject(String subject) {
		this.subject = subject;
		return this;
	}
	public String getContent() {
		return content;
	}
	public QnaTrain setContent(String content) {
		this.content = content;
		return this;
	}
	public String getReply() {
		return reply;
	}
	public QnaTrain setReply(String reply) {
		this.reply = reply;
		return this;
	}
	public String getId() {
		return id;
	}
	public QnaTrain setId(String id) {
		this.id = id;
		return this;
	}
	public String getRep() {
		return rep;
	}
	public QnaTrain setRep(String rep) {
		this.rep = rep;
		return this;
	}
	public Timestamp getIndate() {
		return indate;
	}
	public QnaTrain setIndate(Timestamp indate) {
		this.indate = indate;
		return this;
	}
	public String getRep_id() {
		return rep_id;
	}
	public QnaTrain setRep_id(String rep_id) {
		this.rep_id = rep_id;
		return this;
	}
	
}
