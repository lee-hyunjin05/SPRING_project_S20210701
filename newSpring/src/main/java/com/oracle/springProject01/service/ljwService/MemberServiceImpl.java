package com.oracle.springProject01.service.ljwService;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.oracle.springProject01.dao.ljwDao.MemberDao;
import com.oracle.springProject01.model.AttachmentFile;
import com.oracle.springProject01.model.Member;
import com.oracle.springProject01.model.MemberVo;
import com.oracle.springProject01.model.Report;

@Service("LjwService")
public class MemberServiceImpl implements MemberService {
	@Autowired
	private MemberDao md;

	// 회원 리스트
	@Override
	public List<Member> memberList(Member member) {
		System.out.println("MemberServiceImpl Start memberList...");
		List<Member> memberList = md.memberList(member);

		System.out.println("MemberServiceImpl memberList.size()->" + memberList);

		return memberList;
	}

	// 회원 총 인원 알아보기
	@Override
	public int total() {
		System.out.println("MemberServiceImpl Start total...");
		int totCnt = md.total();

		System.out.println("MemberServiceImpl total totCnt->" + totCnt);

		return totCnt;
	}

	@Override
	public List<AttachmentFile> check(AttachmentFile attachmentFile) {
		System.out.println("MemberServiceImpl Start mail...");
		List<AttachmentFile> check = md.check(attachmentFile);

		return check;
	}

	// 권한 해제
	@Override
	public int user_delete(String m_id) {
		System.out.println("MemberServiceImpl Start user_delete...");
		int delete = md.user_delete(m_id);

		return delete;
	}

	@Override
	public List<Member> auth_listMember(Member member) {
		System.out.println("MemberServiceImpl Start auth_listMember...");
		List<Member> auth_listMember = md.auth_listMember(member);

		return auth_listMember;
	}

	@Override
	public int a_total() {
		System.out.println("MemberServiceImpl Start a_total...");
		md.a_total();

		return md.a_total();
	}

	@Override
	public MemberVo authorityList(MemberVo member) {
		System.out.println("MemberServiceImpl Start authorityList...");

		return md.authorityList(member);
	}

	@Override
	public int authority(MemberVo memberVo) {
		System.out.println("MemberServiceImpl Start authority...");
		int result;

		if (memberVo.getM_meetingauth().equals("N")) {
			memberVo.setM_meetingauth("Y");
			System.out.println("getM_meetingauth()->" + "N -> Y");
		}
		if (memberVo.getM_masterauth().equals("M")) {
			memberVo.setM_masterauth("M");
			System.out.println("getM_masterauth()->" + "M -> M");
		}
		if (memberVo.getM_masterauth().equals("N")) {
			memberVo.setM_masterauth("Y");
			System.out.println("getM_masterauth()->" + "N -> Y");
		}
		if (memberVo.getM_meetingauth().equals("M")) {
			memberVo.setM_meetingauth("M");
			System.out.println("getM_meetingauth()->" + "M -> M");
		}

		return result = md.authority(memberVo);
	}

	@Override
	public int authority2(MemberVo memberVo) {
		System.out.println("MemberServiceImpl Start authority2...");
		int result;

		if (memberVo.getM_meetingauth().equals("N")) {
			memberVo.setM_meetingauth("Y");
			System.out.println("getM_meetingauth()->" + "N -> Y");
		}
		if (memberVo.getM_meetingauth().equals("M")) {
			memberVo.setM_meetingauth("N");
			System.out.println("getM_meetingauth()" + "M -> N");
		}
		if (memberVo.getM_masterauth().equals("N")) {
			memberVo.setM_masterauth("Y");
			System.out.println("getM_masterauth()->" + "N -> Y");
		}
		if (memberVo.getM_masterauth().equals("M")) {
			memberVo.setM_masterauth("N");
			System.out.println("getM_masterauth()->" + "M -> N");
		}

		return result = md.authority(memberVo);
	}

	@Override
	public int report(Report report) {
		System.out.println("MemberServiceImpl Start report...");
		int result = 0;
		result = md.report(report);
		return result;
	}

	@Override
	public int report_total() {
		System.out.println("MemberServiceImpl Start report_total...");
		return md.report_total();
	}

	@Override
	public List<Report> report_list(Report report) {
		System.out.println("MemberServiceImpl Start report_list...");
		List<Report> report_list = md.report_list(report);
		return report_list;
	}

	@Override
	public int report_y(Report report) {
		System.out.println("MemberServiceImpl Start report_y...");
		return md.report_y(report);
	}

	@Override
	public Report report_select(Report report) {
		System.out.println("MemberServiceImpl Start report_select...");
		return md.report_select(report);
	}

}
