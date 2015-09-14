package zx.soft.video.model;

import com.google.common.base.MoreObjects;
import com.google.common.base.Objects;

public class Users {

	private int uid;
	private String uname;
	private String upass;
	private int state;

	public int getUid() {
		return uid;
	}

	public void setUid(int uid) {
		this.uid = uid;
	}

	public String getUname() {
		return uname;
	}

	public void setUname(String uname) {
		this.uname = uname;
	}

	public String getUpass() {
		return upass;
	}

	public void setUpass(String upass) {
		this.upass = upass;
	}

	public int getState() {
		return state;
	}

	public void setState(int state) {
		this.state = state;
	}

	@Override
	public int hashCode() {
		return Objects.hashCode(uid, uname, upass, state);
	}

	@Override
	public String toString() {
		return MoreObjects.toStringHelper(this).add("uid", this.uid).add("uname", this.uname).add("upass", this.upass)
				.add("state", this.state).toString();
	}

}
