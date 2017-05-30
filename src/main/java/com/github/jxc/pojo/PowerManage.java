package com.github.jxc.pojo;

import java.util.Date;

public class PowerManage extends PowerManageKey {
    private Date createdAt;

    private Date updatedAt;
    
	private Power power;
    
    private Role role;
    
    public Power getPower() {
		return power;
	}

	public void setPower(Power power) {
		this.power = power;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

    public Date getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }

    public Date getUpdatedAt() {
        return updatedAt;
    }

    public void setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
}