package _9_12_battlerecord_model;

import java.util.List;

public interface BattleRecordDAO_I
{

	void add(BattleRecordVO battleRecordVO);

	void accept_Reject(Integer battleStatus, Integer battleId);

	void reportA(BattleRecordVO battleRecordVO);

	void reportB(BattleRecordVO battleRecordVO);

	//由service 判斷何時該呼叫此方法
	void updateResult(BattleRecordVO battleRecordVO);

	void delete(Integer batteleRecordId);

	BattleRecordVO findById(Integer battleId);

	List<BattleRecordVO> findByTeamIdA(Integer teamIdA);

	List<BattleRecordVO> findByTeamIdB(Integer teamIdB);

	List<BattleRecordVO> getAll();

	Double getAbsencePercent(Integer teamId);

	Double getWPCT(Integer teamId);

}
