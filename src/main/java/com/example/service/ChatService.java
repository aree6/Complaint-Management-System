package com.example.service;

import com.example.entity.Chat;
import com.example.entity.MessageSender;
import com.example.entity.Complaint;
import com.example.repository.ChatDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatService {
    private final ChatDao chatDao;
    private final ComplaintService complaintService;

    @Autowired
    public ChatService(ChatDao chatDao, ComplaintService complaintService) {
        this.chatDao = chatDao;
        this.complaintService = complaintService;
    }

    public void sendMessage(int complaintId, String message, MessageSender sender) {
        if (message == null || message.trim().isEmpty()) {
            throw new IllegalArgumentException("Message cannot be empty");
        }

        Complaint complaint = complaintService.getComplaintById(complaintId);
        if (complaint == null) {
            throw new IllegalArgumentException("Invalid complaint ID");
        }

        Chat chat = new Chat();
        chat.setComplaint(complaint);
        chat.setMessage(message);
        chat.setSender(sender);
        chatDao.save(chat);
    }

    public List<Chat> getChatHistory(int complaintId) {
        return chatDao.findByComplaintId(complaintId);
    }

    public Chat findById(int chatId) {
        return chatDao.findById(chatId);
    }
}