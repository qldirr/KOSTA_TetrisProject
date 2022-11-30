package com.groupware.tetris.controller.attendance;

import com.groupware.tetris.service.attendance.HrService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.Date;

@Controller
@RequiredArgsConstructor
@RequestMapping("/attendance")
public class HrController {


    private HrService service;


    @GetMapping("/person")
    public void get(@RequestParam("e_id") Long e_id, Model model) {
        //CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        //String e_id = user.getUsername();

        model.addAttribute("hrVO", service.getHr(e_id));
        model.addAttribute("list", service.getHrList(e_id));
    }

//    @PostMapping("/insertAction.do")
//    @ResponseBody
//    public String insertAction(@RequestParam("e_id") String e_id, Model model, RedirectAttributes rttr) {
//        Date date = new Date();
//        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
////	      CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
////	      String e_id = user.getUsername();
//        HrVO hr = new HrVO();
//
//        hr.setE_id(e_id);
//        hr.setHr_Time(formatter.format(date));
//        service.startDate(hr.getE_id());
//        rttr.addFlashAttribute("e_id", hr.getE_id());
//
//        //rttr.addFlashAttribute("result", hr.getE_id());
//        return "redirect:/attendance/person";
//    }

//    @PostMapping("/outAction.do")
//    @ResponseBody
//    public String outAction(Model model, RedirectAttributes rttr) {
////        CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
////        String e_id = user.getUsername();
//        HrVO hr = new HrVO();
//        hr.setE_id(e_id);
//
//        service.outDate(hr.getE_id());
//        rttr.addFlashAttribute("e_id", hr.getE_id());
//
//        return "redirect:/attendance/person";
//    }

//    @PostMapping("/endAction.do")
//    @ResponseBody
//    public String endDate(Model model, RedirectAttributes rttr) {
//        CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
//        String e_id = user.getUsername();
//        HrVO hr = new HrVO();
//        hr.setE_id(e_id);
//
//        service.endDate(hr.getE_id());
//        rttr.addFlashAttribute("e_id", hr.getE_id());
//
//        return "redirect:/attendance/get";
//    }

//personal.jsp

//    @GetMapping("/personal")
//    public void getPersonal(@RequestParam("e_id") Long e_id, @ModelAttribute("cri") Criteria cri, Model model) {
//        model.addAttribute("hrVO", service.getHr(e_id));
//        model.addAttribute("list", service.getPersonal(e_id));
//        model.addAttribute("hrVO2", service.getAttendance(e_id));
//        model.addAttribute("hrVA", service.getHrVA(e_id));
//    }



//personAll.jsp �뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝�룞�삕�뜝占�

//    @GetMapping("/personAll")
//    public void getAll( Criteria cri, Model model) {
//
//        model.addAttribute("list", service.getHrWithPaging(cri));
//        int total = service.getTotal(cri);
//        model.addAttribute("pageMaker", new PageDTO(cri, total));
//    }

//	  @GetMapping("/searchAction.do")
//	  public String searchAction() {
//		  log.info("/searchAction.do");
//		  service.
//
//		  return "redirect: /personAll";
//	  }

//    @GetMapping("/vacation")
//    public void getVac(@RequestParam("e_id") String e_id, Model model) {
//        model.addAttribute("list", service.getVac(e_id));
//    }

}
