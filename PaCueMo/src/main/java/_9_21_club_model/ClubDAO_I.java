package _9_21_club_model;

import java.util.List;

public interface ClubDAO_I
{

	int insert(ClubVO clubVO);

	void delete(int clubId);

	void update(ClubVO clubVO);

	ClubVO findByPK(int clubId) throws RuntimeException;

	List<ClubVO> getAll();

	List<ClubVO> getAll_By_Name(String name);

}
