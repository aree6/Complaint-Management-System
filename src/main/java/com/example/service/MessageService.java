package com.example.service;

import com.example.entity.Chat;
import com.example.entity.Message;
import com.example.entity.User;
import com.example.repository.MessageDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MessageService {
    @Autowired
    private MessageDao messageDao;

    // Send a new Message
    public void sendMessage(Chat chat, User sender, String content) {
        Message message = new Message();
        message.setChat(chat);
        message.setSender(sender);
        message.setContent(content);
        messageDao.save(message);
    }

    // Get Messages by Chat ID
    public List<Message> getMessagesByChatId(int chatId) {
        return messageDao.getByChatId(chatId);
    }

    // Get Messages by Sender ID
    public List<Message> getMessagesBySenderId(int senderId) {
        return messageDao.getBySenderId(senderId);
    }
}
