USE toycircles_db;

# Interests Table

INSERT INTO `interests` (`name`) VALUES ('Sports');
INSERT INTO `interests` (`name`) VALUES ('Legos');
INSERT INTO `interests` (`name`) VALUES ('Painting');
INSERT INTO `interests` (`name`) VALUES ('Cars');
INSERT INTO `interests` (`name`) VALUES ('Reading');
INSERT INTO `interests` (`name`) VALUES ('Music');
INSERT INTO `interests` (`name`) VALUES ('Cooking');

# Inventory Table

INSERT INTO `toy_inventory` (`image1_url`, `image2_url`, `name_of_toy`, `interest_id`, `sku`, `stock_amount`, `toy_description`) VALUES ('https://m.media-amazon.com/images/S/aplus-media/mg/5a5fb694-e4bb-470a-a751-d236cfd61bba._SL300__.jpg', 'https://target.scene7.com/is/image/Target/GUEST_763c01c6-eaca-45d7-81c8-cb880d325412?wid=488&hei=488&fmt=pjpeg', 'Lego Duplo Set', '2', '10034', '25', 'Play out real-life scenarios in LEGO® DUPLO® My Town: a recognizable world with modern DUPLO figures. There are endless play opportunities in this easy-to-build house-toddlers can have fun practicing activities and routines, from getting up in the morning, preparing and eating a meal to washing the car. Watch role-play skills develop as they play out everyday life with 3 DUPLO figures.');

INSERT INTO `toycircles_db`.`toy_inventory` (`image1_url`, `image2_url`, `name_of_toy`, `interest_id`, `sku`, `stock_amount`, `toy_description`) VALUES ('https://images.homedepot-static.com/productImages/58843bc2-fd64-4667-813c-ee5756340e0b/svn/hey-play-train-sets-hw3300003-64_1000.jpg', 'https://target.scene7.com/is/image/Target/GUEST_d604350f-5a2b-402d-9193-a9c1d58edb65?wid=488&hei=488&fmt=pjpeg', 'Toy Train Locomotive Engine', '4', '10035', '10', 'The Toy Train Locomotive Engine Car by Hey! Play! will be endless hours of fun for your little conductor. The bump-n-go action keeps the train chugging on, and when it runs into something, it simply turns and changes course. With lights and sounds, this compact toy train can be played with anywhere. All aboard! ');

INSERT INTO `toycircles_db`.`toy_inventory` (`image1_url`, `image2_url`, `name_of_toy`, `interest_id`, `sku`, `stock_amount`, `toy_description`) VALUES ('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSSFVHZ2GyLwjWZVeMIfu0VSLU8qG-d7PEGxdHvo10znhhsfhPxjg', 'https://www.dhresource.com/0x0s/f2-albu-g4-M01-A3-87-rBVaEFnAvs-AH_BVAAEb0jf0mAk248.jpg/colorful-cartoon-standard-bowling-set-10.jpg', 'Mini Bowling Set', '1', '10036', '7', 'Fun bowling set for toddlers. It helps to promote kids motor skills, balance and hand&eye coordination. And it is great sport toy, improve kids interested in sport and have great fun when playing it. Good for your kids physical and mental health.');

INSERT INTO `toycircles_db`.`toy_inventory` (`image1_url`, `image2_url`, `name_of_toy`, `interest_id`, `sku`, `stock_amount`, `toy_description`) VALUES ('https://target.scene7.com/is/image/Target/GUEST_f8655c18-a9ef-4745-809d-710519d6f6f9?wid=488&hei=488&fmt=pjpeg', 'https://target.scene7.com/is/image/Target/GUEST_48dbde85-b954-4498-b089-fb75e8280eef?wid=488&hei=488&fmt=pjpeg', 'Paw Patrol Plush Chase', '5', '10037', '6', 'This pup\'s soft fur is perfect for snuggling - and now, even his police cap is made of plush material! Wearing his Ultimate Police Rescue uniform, Chase is dressed for cuddles and adventure! Even Chase\'s paws feature real paw print detailing! Ready for anything, Police Rescue Chase makes playtime fun and naptime cozy! Bring home all the adventure of the hit TV show with plush Police Rescue Chase!\n');

INSERT INTO `toycircles_db`.`toy_inventory` (`image1_url`, `image2_url`, `name_of_toy`, `interest_id`, `sku`, `stock_amount`, `toy_description`) VALUES ('https://target.scene7.com/is/image/Target/GUEST_ce974e63-7354-4fa1-a963-6cf87597cd54?wid=488&hei=488&fmt=pjpeg', 'https://i.ebayimg.com/images/g/sooAAOSwn01cCVbz/s-l300.png', 'Meowsic Keyboard Piano', '6', '10038', '4', 'Meowsic from B toys is a cat-inspired toddler keyboard. This interactive toy piano lets you choose between meows, bells, organ and banjo; 27 songs or create your own! Lyrics are included, so grab the retractable microphone and sing along. This lightweight and portable kids keyboard won many awards over the years, such has Disney\'s family fun toy of the year, Dr Toy, Creative Child Toy Award. With its sturdy, toddler-proof construction, Meowsic is the perfect way to introduce music to babies and toddlers. ');

INSERT INTO `toycircles_db`.`toy_inventory` (`image1_url`, `image2_url`, `name_of_toy`, `interest_id`, `sku`, `stock_amount`, `toy_description`) VALUES ('https://images-na.ssl-images-amazon.com/images/I/61i3T4EA6xL._SX466_.jpg', 'https://images-na.ssl-images-amazon.com/images/I/71wXWqVFV8L._SX466_.jpg', 'Fast Food Bus Kitchen Play Set', '7', '10039', '7', 'Kids can now manage their very own portable fast food trucks! This food bus comes with plenty of cooking utensils and play food. It is perfect for aspiring young chefs who want everyone to taste a sample of their cooking!');


# Subscribers

INSERT INTO `toycircles_db`.`subscriber` (`name`, `email`, `password_hash`, `address`, `num_children`, `ages`, `last_log_in`, `sign_up_date`) VALUES ('Aji Sohna Bayo', 'bayoajisohna@gmail.com', 'password', '327 S Bell Street, Fremont, CA 94587', '1', '3', '2019-04-22 05:02:59', '2019-04-22 05:02:59');

INSERT INTO `toycircles_db`.`subscriber` (`name`, `email`, `password_hash`, `address`, `num_children`, `ages`, `last_log_in`, `sign_up_date`) VALUES ('S J', 'serignjobe@gmail.com', 'password', 'Address', '2', '4, 2', '2019-04-22 05:02:59', '2019-04-22 05:02:59');

INSERT INTO `toycircles_db`.`subscriber` (`name`, `email`, `password_hash`, `address`, `num_children`, `ages`, `last_log_in`, `sign_up_date`) VALUES ('Alex', 'AlexJ@gmail.com', 'password', 'Address', '1', '7', '2019-04-22 05:02:59', '2019-04-22 05:02:59');


#Subscriber Interest Table

INSERT INTO `toycircles_db`.`subscriber_interests` (`interest_id`, `subscriber_id`) VALUES ('3', '2');
INSERT INTO `toycircles_db`.`subscriber_interests` (`interest_id`, `subscriber_id`) VALUES ('6', '2');
INSERT INTO `toycircles_db`.`subscriber_interests` (`interest_id`, `subscriber_id`) VALUES ('1', '2');
INSERT INTO `toycircles_db`.`subscriber_interests` (`interest_id`, `subscriber_id`) VALUES ('4', '3');
INSERT INTO `toycircles_db`.`subscriber_interests` (`subscriber_id`) VALUES ('3');


# Monthly Curations

INSERT INTO `toycircles_db`.`monthly_curations` (`subscriber_id`, `toy_inventory_id`, `delivery_date`) VALUES ('2', '2', '2019-01-01 00:00:00');
INSERT INTO `toycircles_db`.`monthly_curations` (`subscriber_id`, `toy_inventory_id`, `delivery_date`) VALUES ('2', '4', '2019-01-01 00:00:00');
INSERT INTO `toycircles_db`.`monthly_curations` (`subscriber_id`, `toy_inventory_id`, `delivery_date`) VALUES ('3', '1', '2019-01-01 00:00:00');
INSERT INTO `toycircles_db`.`monthly_curations` (`subscriber_id`, `toy_inventory_id`, `delivery_date`) VALUES ('3', '5', '2019-01-01 00:00:00');

INSERT INTO `toycircles_db`.`monthly_curations` (`subscriber_id`, `toy_inventory_id`, `delivery_date`) VALUES ('2', '1', '2019-02-01 00:00:00');
INSERT INTO `toycircles_db`.`monthly_curations` (`subscriber_id`, `toy_inventory_id`, `delivery_date`) VALUES ('2', '5', '2019-02-01 00:00:00');
INSERT INTO `toycircles_db`.`monthly_curations` (`subscriber_id`, `toy_inventory_id`, `delivery_date`) VALUES ('3', '2', '2019-02-01 00:00:00');
INSERT INTO `toycircles_db`.`monthly_curations` (`subscriber_id`, `toy_inventory_id`, `delivery_date`) VALUES ('3', '4', '2019-02-01 00:00:00');

INSERT INTO `toycircles_db`.`monthly_curations` (`subscriber_id`, `toy_inventory_id`, `delivery_date`) VALUES ('2', '3', '2019-03-01 00:00:00');
INSERT INTO `toycircles_db`.`monthly_curations` (`subscriber_id`, `toy_inventory_id`, `delivery_date`) VALUES ('2', '6', '2019-03-01 00:00:00');
INSERT INTO `toycircles_db`.`monthly_curations` (`subscriber_id`, `toy_inventory_id`, `delivery_date`) VALUES ('3', '6', '2019-03-01 00:00:00');
INSERT INTO `toycircles_db`.`monthly_curations` (`subscriber_id`, `toy_inventory_id`, `delivery_date`) VALUES ('3', '3', '2019-03-01 00:00:00');

INSERT INTO `toycircles_db`.`monthly_curations` (`subscriber_id`, `toy_inventory_id`, `delivery_date`) VALUES ('2', '4', '2019-04-01 00:00:00');
INSERT INTO `toycircles_db`.`monthly_curations` (`subscriber_id`, `toy_inventory_id`, `delivery_date`) VALUES ('2', '2', '2019-04-01 00:00:00');
INSERT INTO `toycircles_db`.`monthly_curations` (`subscriber_id`, `toy_inventory_id`, `delivery_date`) VALUES ('3', '1', '2019-04-01 00:00:00');
INSERT INTO `toycircles_db`.`monthly_curations` (`subscriber_id`, `toy_inventory_id`, `delivery_date`) VALUES ('3', '5', '2019-04-01 00:00:00');