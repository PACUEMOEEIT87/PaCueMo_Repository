package _21_club_service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import _9_21_club_model.ClubDAO_I;
import _9_21_club_model.ClubVO;
import _9_22_clubMember_model.ClubMemberDAO_I;
import _9_22_clubMember_model.ClubMemberVO;
import _9_41_member_model.MemberDAO;
import _9_41_member_model.MemberDAO_interface;

@Component
public class Club_Service
{
	private ClubDAO_I clubDAO;
	private ClubMemberDAO_I clubMemberDAO;
	private MemberDAO_interface memberDAO;

	@Autowired
	public void setClubDAO(ClubDAO_I clubDAO)
	{
		this.clubDAO = clubDAO;
	}

	@Autowired
	public void setClubMemberDAO(ClubMemberDAO_I clubMemberDAO)
	{
		this.clubMemberDAO = clubMemberDAO;
	}

	@Autowired
	public void setMemberDAO(MemberDAO memberDAO)
	{
		this.memberDAO = memberDAO;
	}

	//用社團名稱模糊比對
	public List<ClubVO> searchClub(String name)
	{
		return clubDAO.getAll_By_Name(name);
	}

	//註冊新社團
	public int registerClub(ClubVO clubVO)
	{
		return clubDAO.insert(clubVO);

	}

	//get社團、成員資訊
	public ClubVO getClub(int clubId)
	{

		ClubVO clubVO = clubDAO.findByPK(clubId);
		List<ClubMemberVO> clubMemberVOs = clubMemberDAO.getClubAll(clubId);
		for (ClubMemberVO vo : clubMemberVOs)
		{
			vo.setMember(memberDAO.findByPrimaryKey(vo.getClubMemberId()));
		}
		clubVO.setClubmembers(clubMemberVOs);
		return clubVO;
	}

	//get社團資訊by clubMemberID
	public ClubVO getClub_byMemberId(String memberId) throws SQLException
	{
		ClubMemberVO clubMemberVO = clubMemberDAO.findByPK(memberId);
		if (clubMemberVO == null)
		{
			throw new SQLException();
		}
		else
		{
			return getClub(clubMemberVO.getClubId());
		}
	}

}