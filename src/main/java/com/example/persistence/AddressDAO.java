package com.example.persistence;

import java.util.List;

import com.example.domain.AddressVO;

public interface AddressDAO {
	public List<AddressVO> list(int start,String key,String word);
	public int total(String key,String word);
}
