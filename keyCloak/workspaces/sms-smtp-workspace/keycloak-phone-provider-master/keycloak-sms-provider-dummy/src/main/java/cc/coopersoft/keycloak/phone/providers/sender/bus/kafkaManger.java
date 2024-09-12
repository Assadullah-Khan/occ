package cc.coopersoft.keycloak.phone.providers.sender.bus;
import org.apache.kafka.clients.producer.*;
import org.apache.kafka.clients.consumer.*;
import org.apache.kafka.common.serialization.StringDeserializer;
import org.apache.kafka.common.serialization.StringSerializer;

import java.time.Duration;
import java.util.Collections;
import java.util.Objects;
import java.util.Properties;



public class kafkaManger {
    // Producer method
    static public void produceMessage(String topic, String key, String event) {
        Properties properties = new Properties();
        properties.put("bootstrap.servers", kafkaConfig.KAFKA_SERVER_URL);
        properties.put("key.serializer", StringSerializer.class.getName());
        properties.put("value.serializer", StringSerializer.class.getName());

        try (Producer<String, String> producer = new KafkaProducer<>(properties)) {
//            String event = "{"
//                    + "\"id\":\"" + "fa6a54a7-0d6b-4ab7-9805-656563021c74" + "\","
//                    + "\"eventType\":\"" + "SEND_EMAIL_WELCOME" + "\","
//                    + "\"timestamp\":" + System.currentTimeMillis() + ","
//                    + "\"groupId\":\"" + kafkaConfig.GROUP_ID + "\","
//                    + "\"type\":\"trigger\","
//                    + "\"data\":" + "{\"username\":"+value+", \"name\":\"moyed\"}" // Assuming data is a valid JSON string
//                    + "}";


            ProducerRecord<String, String> record = new ProducerRecord<>(topic, key, event);

            producer.send(record, (metadata, exception) -> {
                if (exception == null) {
                    System.out.println("Message sent successfully: " +
                            "Topic: " + metadata.topic() +
                            ", Partition: " + metadata.partition() +
                            ", Offset: " + metadata.offset());
                } else {
                    System.err.println("Error sending message: " + exception.getMessage());
                }
            });
        }
    }

    // Consumer method
    static public void consumeMessages(String groupId, String topic) {
        Properties properties = new Properties();
        properties.put("bootstrap.servers", kafkaConfig.KAFKA_SERVER_URL);
        properties.put("group.id", groupId);
        properties.put("key.deserializer", StringDeserializer.class.getName());
        properties.put("value.deserializer", StringDeserializer.class.getName());

        try (Consumer<String, String> consumer = new KafkaConsumer<>(properties)) {
            consumer.subscribe(Collections.singletonList(topic));

            while (true) {
                ConsumerRecords<String, String> records = consumer.poll(Duration.ofMillis(100));

                records.forEach(record -> {
                    System.out.printf("Consumed record with key %s and value %s%n", record.key(), record.value());
                });
            }
        }
    }
}
