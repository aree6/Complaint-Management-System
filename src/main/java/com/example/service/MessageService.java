package com.example.service;

import com.example.entity.Message;
import com.example.entity.MessageSender;
import com.example.repository.MessageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.time.LocalDateTime;

@Service
public class MessageService {
    @Autowired
    private MessageDao messageDao;
    @Autowired
    private ComplaintService complaintService;
    @Autowired
    private UserService userService;

    public void sendMessage(int complaintId, int senderId, String content, MessageSender senderType) {
        if (content == null || content.trim().isEmpty()) {
            throw new IllegalArgumentException("Message content cannot be empty");
        }

        Message message = new Message();
        message.setComplaint(complaintService.getComplaintById(complaintId));
        message.setSender(userService.getUserById(senderId));
        message.setContent(content);
        message.setSenderType(senderType);
        message.setCreatedAt(LocalDateTime.now());
        
        messageDao.save(message);
    }

    public List<Message> getComplaintMessages(int complaintId) {
        return messageDao.findByComplaintId(complaintId);
    }
}
