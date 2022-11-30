package com.groupware.tetris.controller;

import com.groupware.tetris.dto.attendance.HrDto;
import com.groupware.tetris.dto.attendance.HrPageDto;
import com.groupware.tetris.service.HrService;
import lombok.RequiredArgsConstructor;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.web.PageableDefault;
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
    public void get(@RequestParam("e_id") Long e_id, Model model) throws Exception {
        //CustomUser user = (CustomUser) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        //String e_id = user.getUsername();

        model.addAttribute("hrVO", service.getHr(e_id));
        model.addAttribute("list", service.getHrList(e_id));
    }

    @PostMapping("/insertAction.do")
    @ResponseBody
    public String insertAction(@RequestParam("e_id") Long e_id, Model model, RedirectAttributes rttr) throws Exception {
        Date date = new Date();
        SimpleDateFormat formatter = new SimpleDateFormat("HH:mm:ss");
        HrDto hr = new HrDto();

        hr.setE_id(e_id);
        hr.setHr_Time(formatter.format(date));
        service.startDate(hr);
        rttr.addFlashAttribute("e_id", hr.getE_id());

        //rttr.addFlashAttribute("result", hr.getE_id());
        return "redirect:/attendance/person";
    }

    @PostMapping("/outAction.do")
    @ResponseBody
    public String outAction(@RequestParam("e_id") Long e_id, Model model, RedirectAttributes rttr) throws Exception {
        HrDto hr = new HrDto();
        hr.setE_id(e_id);

        service.outDate(hr);
        rttr.addFlashAttribute("e_id", hr.getE_id());

        return "redirect:/attendance/person";
    }

    @PostMapping("/endAction.do")
    @ResponseBody
    public String endDate(@RequestParam("e_id") Long e_id, Model model, RedirectAttributes rttr) throws Exception {
        HrDto hr = new HrDto();
        hr.setE_id(e_id);

        service.endDate(hr);
        rttr.addFlashAttribute("e_id", hr.getE_id());

        return "redirect:/attendance/get";
    }

//personal.jsp

    @GetMapping("/personal")
    public void getPersonal(@RequestParam("e_id") Long e_id,  Model model) throws Exception {
        model.addAttribute("hrVO", service.getHr(e_id));
        model.addAttribute("list", service.getPersonal(e_id));
        model.addAttribute("hrVO2", service.getAttendance(e_id));
        model.addAttribute("hrVA", service.getHrVA(e_id));
    }

    @GetMapping("/personAll")
    public void getAll(@PageableDefault(sort = "id", direction = Sort.Direction.DESC)Pageable pageable, Model model) {

        model.addAttribute("list", service.getHrWithPaging(pageable));
        int total = service.getTotal(pageable);
        model.addAttribute("pageMaker", new HrPageDto(pageable, total));
    }

//	  @GetMapping("/searchAction.do")
//	  public String searchAction() {
//		  log.info("/searchAction.do");
//		  service.
//
//		  return "redirect: /personAll";
//	  }

    @GetMapping("/vacation")
    public void getVac(@RequestParam("e_id") Long e_id, Model model) {
        model.addAttribute("list", service.getVac(e_id));
    }

}
