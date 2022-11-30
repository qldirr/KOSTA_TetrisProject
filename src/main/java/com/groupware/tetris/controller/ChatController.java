package com.groupware.tetris.controller;

import com.google.gson.Gson;
import com.groupware.tetris.dto.chat.ChatContentsDto;
import com.groupware.tetris.dto.chat.ChatParticipantDto;
import com.groupware.tetris.entity.chat.ChatContents;
import com.groupware.tetris.entity.chat.ChatParticipant;
import com.groupware.tetris.entity.chat.ChatRoom;
import com.groupware.tetris.repository.ChatParticipantRepository;
import com.groupware.tetris.repository.ChatRoomRepository;
import com.groupware.tetris.service.ChatService;
import com.groupware.tetris.service.EmployeeService;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import java.security.Principal;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/messanger")
@RequiredArgsConstructor
public class ChatController {

    private final ChatService chatService;

    private final ChatRoomRepository chatRoomRepository;

    private final ChatParticipantRepository chatParticipantRepository;

    @GetMapping(value = {"/main", "/main/emplist"})
    public String main(Model model){
        model.addAttribute("empList", chatService.getListEmp());
        model.addAttribute("deptList", chatService.getListDept());
        return "/messanger/main/emplist";
    }

    @GetMapping("/main/chatroomlist")
    public void chatRoomList(Principal principal, Model model){
        String empId = principal.getName();
        List<ChatRoom> chatRoomList = chatService.getListChatRoom(empId);
        model.addAttribute("listChatRoom", chatRoomList);
    }

    @PostMapping("/createchatroom")
    public String createChatRoom(HttpServletRequest request, Principal principal, Model model){
        Long empId = Long.valueOf(request.getParameter("e_id"));
        ChatRoom chatRoom = chatService.createChatRoom(empId, principal.getName());
        model.addAttribute("cr_id", chatRoom.getId());
        model.addAttribute("cr_title", chatRoom.getTitle());

        return "/messanger/stompchat";
    }

    @PostMapping("/registerMsg")
    @ResponseBody
    public String registerMsg(@RequestBody ChatContentsDto chatContentsDto, Principal principal){
        chatService.registerChatContents(chatContentsDto, principal.getName(), chatContentsDto.getRoomId());
        Gson gson = new Gson();
        String chatContentsJson = gson.toJson(chatContentsDto);

        return chatContentsJson;
    }

    @PostMapping("/getListMsg")
    @ResponseBody
    public String getListMsg(@RequestBody Map<String, Object> map){
        String cr_id = (String)map.get("cr_id");
        List<ChatContents> chatContentsList = chatService.getListChatContents(cr_id);
        Gson gson = new Gson();
        String chatContentsListJson = gson.toJson(chatContentsList);

        return chatContentsListJson;
    }

    @PostMapping("/updatecroomfavor")
    @ResponseBody
    public String updateCRoomFavor(@RequestBody ChatParticipantDto chatParticipantDto){
        chatService.updateCRoomFavor(chatParticipantDto);
        Gson gson = new Gson();
        String chatPartJson = gson.toJson(chatParticipantDto);

        return chatPartJson;
    }

    @PostMapping("/deletechatpart")
    @ResponseBody
    public void deleteChatPart(@RequestBody ChatParticipantDto chatParticipantDto){
        chatService.deleteChatRoom(chatParticipantDto);
    }

    //채팅방 목록 조회
//    @GetMapping("/main/chatroomlist")
//    public void chatRoomList(Model model){
//        model.addAttribute("chatRoomList", chatService.finnAllRoom());
//    }

    //채팅방 생성
//    @PostMapping("/main/createchatroom")
//    public String register(@RequestParam String roomName, RedirectAttributes rttr){
//        rttr.addFlashAttribute("roomName", chatService.createRoom(roomName));
//
//        return "redirect:/messanger/main/chatroomlist";
//    }

    //채팅방 입장
//    @GetMapping("/main/enter/{roomId}")
//    public String roomDetail(Model model, @PathVariable String roomId){
//        model.addAttribute("roomId", roomId);
//
//        return "/messanger/chatting";
//    }

    //특정 채팅방 조회
//    @GetMapping("/main/getchatroom/{roomId}")
//    public void getChatRoom(@PathVariable String roomId, Model model){
//        model.addAttribute("chatRoom", chatService.findById(roomId));
//    }

}
