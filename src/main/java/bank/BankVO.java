package bank;

public class BankVO {

	private String ac_num;
	private String ac_num2;
	private String ac_name;
	private String id;
	private String bankcode;
	private String acpw;
	private String acmadedate;
	private String money;
	private String historyname;
	private String historytime;
	private String historymoney;
	
	@Override
	public String toString() {
		return "BankVO [ac_num=" + ac_num + ", ac_num2=" + ac_num2 + ", ac_name=" + ac_name + ", id=" + id
				+ ", bankcode=" + bankcode + ", acpw=" + acpw + ", acmadedate=" + acmadedate + ", money=" + money
				+ ", historyname=" + historyname + ", historytime=" + historytime + ", historymoney=" + historymoney
				+ "]";
	}
	public BankVO(String ac_num, String ac_num2, String ac_name, String id, String bankcode, String acpw,
			String acmadedate, String money, String historyname, String historytime, String historymoney) {
		super();
		this.ac_num = ac_num;
		this.ac_num2 = ac_num2;
		this.ac_name = ac_name;
		this.id = id;
		this.bankcode = bankcode;
		this.acpw = acpw;
		this.acmadedate = acmadedate;
		this.money = money;
		this.historyname = historyname;
		this.historytime = historytime;
		this.historymoney = historymoney;
	}
	
	public BankVO() {
		// TODO Auto-generated constructor stub
	}
	public String getAc_num() {
		return ac_num;
	}
	public void setAc_num(String ac_num) {
		this.ac_num = ac_num;
	}
	public String getAc_num2() {
		return ac_num2;
	}
	public void setAc_num2(String ac_num2) {
		this.ac_num2 = ac_num2;
	}
	public String getAc_name() {
		return ac_name;
	}
	public void setAc_name(String ac_name) {
		this.ac_name = ac_name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBankcode() {
		return bankcode;
	}
	public void setBankcode(String bankcode) {
		this.bankcode = bankcode;
	}
	public String getAcpw() {
		return acpw;
	}
	public void setAcpw(String acpw) {
		this.acpw = acpw;
	}
	public String getAcmadedate() {
		return acmadedate;
	}
	public void setAcmadedate(String acmadedate) {
		this.acmadedate = acmadedate;
	}
	public String getMoney() {
		return money;
	}
	public void setMoney(String money) {
		this.money = money;
	}
	public String getHistoryname() {
		return historyname;
	}
	public void setHistoryname(String historyname) {
		this.historyname = historyname;
	}
	public String getHistorytime() {
		return historytime;
	}
	public void setHistorytime(String historytime) {
		this.historytime = historytime;
	}
	public String getHistorymoney() {
		return historymoney;
	}
	public void setHistorymoney(String historymoney) {
		this.historymoney = historymoney;
	}

	}