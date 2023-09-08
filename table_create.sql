create table if not exists tb_user (
    `user_name` varchar(255) not null,
    `password` varchar(255) not null,
    `nick_name` varchar(255),
    `phone` varchar(255),
    `identity_num` varchar(255),
    `address` varchar(255),
    `role` varchar(255),
    `create_time` timestamp,
    `update_time` timestamp,
    `integral` int default 0,
    `real_name` varchar(255),
    `credit` int default 0,
    `avatar` varchar(255),
    primary key (`user_name`)
);

create table if not exists tb_order (
    `order_id` int not null auto_increment,
    `title` varchar(255) not null,
    `price` decimal(9,2) not null,
    `content` varchar(255) not null,
    `order_status` int,
    `type` varchar(255),
    `picture` varchar(255),
    `own_name` varchar(255),
    `cooperation_name` varchar(255),
    `create_time` timestamp,
    `update_time` timestamp,
    `address` varchar(255),
    primary key (`order_id`)
);

create table if not exists tb_knowledge (
    `knowledge_id` int not null auto_increment,
    `title` varchar(255) not null,
    `content` varchar(255) not null,
    `pic_path` varchar(255),
    `own_name` varchar(255),
    `create_time` timestamp,
    `update_time` timestamp,
    primary key (`knowledge_id`)
);

create table if not exists tb_discuss (
    `discuss_id` int not null auto_increment,
    `knowledge_id` int not null,
    `content` varchar(255) not null,
    `own_name` varchar(255),
    `create_time` timestamp,
    primary key (`discuss_id`),
    foreign key (`knowledge_id`) references tb_knowledge(`knowledge_id`)
);

create table if not exists tb_question (
    `id` int not null auto_increment,
    `real_name` varchar(255),
    `questioner` varchar(255),
    `phone` varchar(20) not null,
    `plant_name` varchar(255) not null,
    `title` varchar(255) not null,
    `question` varchar(255),
    `answer` varchar(255),
    `status` int,
    primary key (`id`)
);

create table if not exists tb_expert (
    `user_name` varchar(255) not null,
    `real_name` varchar(255) not null,
    `phone` varchar(20) not null,
    `profession` varchar(255) not null,
    `position` varchar(255) not null,
    `belong` varchar(255) not null,
    primary key (`user_name`)
);

create table if not exists tb_reserve (
    `id` int not null auto_increment,
    `expert_name` varchar(255),
    `questioner` varchar(255),
    `area` varchar(255) not null ,
    `address` varchar(255) not null,
    `plant_name` varchar(255) not null,
    `soil_condition` varchar(255) not null,
    `plant_condition` varchar(255) not null,
    `plant_detail` varchar(255) not null,
    `phone` varchar(20) not null,
    `message` varchar(255),
    `answer` varchar(255),
    `status` int,
    primary key (`id`)
);

create table if not exists tb_shoppingcart (
    `shopping_id` int not null auto_increment,
    `order_id` int not null,
    `count` int,
    `own_name` varchar(255),
    `create_time` timestamp,
    `update_time` timestamp,
    primary key (`shopping_id`),
    foreign key (`order_id`) references tb_order(`order_id`)
);

create table if not exists tb_bank (
    `bank_id` int not null auto_increment,
    `bank_name` varchar(255),
    `introduce` varchar(255),
    `bank_phone` varchar(255),
    `money` decimal(9,2),
    `rate` decimal(9,2),
    `repayment` int,
    primary key (`bank_id`)
);

create table if not exists tb_finance (
    `finance_id` int not null auto_increment,
    `bank_id` int,
    `own_name` varchar(255),
    `real_name` varchar(255),
    `status` int,
    `money` decimal(9,2) not null,
    `rate` decimal(9,2) not null,
    `repayment` int not null,
    `create_time` timestamp,
    `update_time` timestamp,
    primary key (`finance_id`),
    foreign key (`bank_id`) references tb_bank(`bank_id`)
);

create table if not exists tb_purchase (
    `purchase_id` int not null auto_increment,
    `own_name` varchar(255),
    `purchase_type` int,
    `total_price` decimal(9,2),
    `address` varchar(255),
    `purchase_status` int,
    `create_time` timestamp,
    `update_time` timestamp,
    primary key (`purchase_id`)
);

create table if not exists tb_purchase_detail (
    `detail_id` int not null auto_increment,
    `purchase_id` int,
    `order_id` int,
    `unin_price` decimal(9,2),
    `sum_price` decimal(9,2),
    `count` int,
    primary key (`detail_id`),
    foreign key (`purchase_id`) references tb_purchase(`purchase_id`),
    foreign key (`order_id`) references tb_order(`order_id`)
);

create table if not exists tb_sell_purchase (
    `sell_purchase_id` int not null auto_increment,
    `purchase_id` int,
    `order_id` int,
    `own_name` varchar(255),
    `purchase_type` int,
    `unin_price` decimal(9,2),
    `sum_price` decimal(9,2),
    `address` varchar(255),
    `purchase_status` int,
    `create_time` timestamp,
    `update_time` timestamp,
    `phone` varchar(20),
    primary key (`sell_purchase_id`),
    foreign key (`purchase_id`) references tb_purchase(`purchase_id`),
    foreign key (`order_id`) references tb_order(`order_id`)
);

create table if not exists tb_address (
    `id` int not null auto_increment,
    `own_name` varchar(255),
    `consignee` varchar(255),
    `phone` varchar(20),
    `address_detail` varchar(255),
    `is_default` int,
    primary key (`id`)
);
