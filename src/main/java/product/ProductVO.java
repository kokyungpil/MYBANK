package product;

public class ProductVO {

	private String pdcode;
	private String pdname;
	private String id;
	private String acnum;
	private String acmoney;
	private String pdmadedate;
	
	public ProductVO(String pdcode, String pdname, String id, String acnum, String pdmadedate, String acmoney ) {
		super();
		this.pdcode = pdcode;
		this.pdname = pdname;
		this.id = id;
		this.acnum = acnum;
		this.acmoney = acmoney;
		this.pdmadedate = pdmadedate;
	}

	@Override
	public String toString() {
		return "ProductVO [pdcode=" + pdcode + ", pdname=" + pdname + ", id=" + id + ", acnum=" + acnum
				+ ", pdmadedate=" + pdmadedate + "]";
	}
	
	
	public ProductVO() {
		// TODO Auto-generated constructor stub
	}
	
	public String getPdcode() {
		return pdcode;
	}

	public void setPdcode(String pdcode) {
		this.pdcode = pdcode;
	}

	public String getPdname() {
		return pdname;
	}

	public void setPdname(String pdname) {
		this.pdname = pdname;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getAcnum() {
		return acnum;
	}

	public void setAcnum(String acnum) {
		this.acnum = acnum;
	}

	public String getPdmadedate() {
		return pdmadedate;
	}

	public void setPdmadedate(String pdmadedate) {
		this.pdmadedate = pdmadedate;
	}

	public String getAcmoney() {
		return acmoney;
	}

	public void setAcmoney(String acmoney) {
		this.acmoney = acmoney;
	}
}