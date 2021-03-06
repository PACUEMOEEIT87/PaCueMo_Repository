package _10_team_service;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import _9_10_team_model.TeamDAO_interface;
import _9_10_team_model.TeamVO;
import _9_11_teammember_model.TeamMemberDAO_interface;
import _9_11_teammember_model.TeamMemberVO;
import _9_41_member_model.MemberDAO_interface;

@Component
@Transactional
public class TeamService
{

	@Autowired
	private TeamDAO_interface teamDAO;
	@Autowired
	private TeamMemberDAO_interface teamMemberDAO;
	@Autowired
	private MemberDAO_interface memberDAO;

	public TeamService()
	{
	}

	@Transactional(readOnly = false, propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public void createTeam(TeamVO teamVO) throws SQLException
	{
		teamDAO.insert(teamVO);
		Integer teamId = teamDAO.find_TeamId(teamVO.getTeamHead());
		teamMemberDAO.insert(teamId, teamVO.getTeamHead());
		System.out.println("creatTeam");
	}

	public void update(Integer teamId, String teamName, Date createDate, Integer teamProp, String teamHead,
			Double avgRank)
	{
		TeamVO teamVO = new TeamVO();
		teamVO.setTeamId(teamId);
		teamVO.setTeamName(teamName);
		teamVO.setCreateDate(createDate);
		teamVO.setTeamProp(teamProp);
		teamVO.setTeamHead(teamHead);
		teamVO.setAvgRank(avgRank);

		teamDAO.update(teamVO);
	}

	public void update(TeamVO teamVO)
	{
		teamDAO.update(teamVO);
	}

	public void delete(Integer teamId)
	{
		teamDAO.delete(teamId);
	}

	public TeamVO getOne(Integer teamId)
	{
		TeamVO teamVO = teamDAO.findByPrimaryKey(teamId);
		List<TeamMemberVO> teamMemberVOs = teamMemberDAO.getOneTeam(teamId);
		for (TeamMemberVO list : teamMemberVOs)
		{
			list.setMemberVO(memberDAO.findByPrimaryKey(list.getTeamMemberId()));
		}
		teamVO.setTeamMemberVOs(teamMemberVOs);
		return teamVO;
	}

	public List<TeamVO> getAll()
	{
		return teamDAO.getAll();
	}
}
