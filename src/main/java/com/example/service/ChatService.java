package com.example.service;

import com.example.entity.Chat;
import com.example.entity.Complaint;
import com.example.repository.ChatDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ChatService {
    @Autowired
    private ChatDao chatDao;

    // Create a new Chat
    public void createChat(Complaint complaint) {
        Chat chat = new Chat();
        chat.setComplaint(complaint);
        chatDao.save(chat);
    }

    // Get Chat by ID
    public Chat getChatById(int id) {
        return chatDao.getById(id);
    }

    // Get Chats by Complaint ID
    public List<Chat> getChatsByComplaintId(int complaintId) {
        return chatDao.getByComplaintId(complaintId);
    }

    // Delete Chat
    public void deleteChat(int id) {
        chatDao.delete(id);
    }
}
