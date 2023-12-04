import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.muze.calendar.model.service.CalendarService;
import com.kh.muze.calendar.model.vo.Diary;
import com.kh.muze.calendar.model.vo.Schedule;
import com.kh.muze.common.template.LoginUser;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class CalendarController {
	
	private final CalendarService calendarService;
	
	// diary forwarding하면서 내용 가지고 오기
	@GetMapping("calendar.ca")
	public String diary(Model model,HttpSession session) {
		// Class로 빼놓은 loginUser의 userNo값
		int diaryUser = LoginUser.getUserNo(session);
		
		// DIARY LIST SELECT
		ArrayList<Diary> diaryList = calendarService.selectDiary(diaryUser);
		model.addAttribute("diaryList",diaryList);
		// SCHEDULE LIST SELECT
		ArrayList<Schedule> scheduleList = calendarService.selectSchedule(diaryUser);
		model.addAttribute("scheduleList",scheduleList);
		
		if(!diaryList.isEmpty() && diaryList != null) {
			// 어차피 SQL에서 if null일 때  YOU ARE MY DIARY로 뽑았기 때문에 그대로 diaryName을 입력해주면 된다
			String diaryName = diaryList.get(0).getDiaryName();
			if(diaryName.equals("YOU ARE MY DIARY")) {
				model.addAttribute("diaryName", diaryName);
			}else {
				model.addAttribute("diaryName",diaryName);
			}
		}else {
			// diaryList가 null이면 아예 YOU ARE MY DIARY로 값을 입력하여 넘겨준다
			model.addAttribute("diaryName","YOU ARE MY DIARY");
		}
		return "diary/diaryCalender";
	}

}
