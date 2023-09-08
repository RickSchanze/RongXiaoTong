create table if not exists tb_user (
                                       `userName` varchar(255) not null,
                                       `password` varchar(255) not null,
                                       `nickName` varchar(255),
                                       `phone` varchar(255),
                                       `identityNum` varchar(255),
                                       `address` varchar(255),
                                       `role` varchar(255),
                                       `createTime` timestamp,
                                       `updateTime` timestamp,
                                       `integral` int default 0,
                                       `realName` varchar(255),
                                       `credit` int default 0,
                                       `avatar` varchar(255),
                                       primary key (`userName`)
);

create table if not exists tb_order (
                                        `orderId` int not null auto_increment,
                                        `title` varchar(255) not null,
                                        `price` decimal(9,2) not null,
                                        `content` varchar(255) not null,
                                        `orderStatus` int,
                                        `type` varchar(255),
                                        `picture` varchar(255),
                                        `ownName` varchar(255),
                                        `cooperationName` varchar(255),
                                        `createTime` timestamp,
                                        `updateTime` timestamp,
                                        `address` varchar(255),
                                        primary key (`orderId`)
);

create table if not exists tb_knowledge (
                                            `knowledgeId` int not null auto_increment,
                                            `title` varchar(255) not null,
                                            `content` varchar(255) not null,
                                            `picPath` varchar(255),
                                            `ownName` varchar(255),
                                            `createTime` timestamp,
                                            `updateTime` timestamp,
                                            primary key (`knowledgeId`)
);

create table if not exists tb_discuss (
                                          `discussId` int not null auto_increment,
                                          `knowledgeId` int not null,
                                          `content` varchar(255) not null,
                                          `ownName` varchar(255),
                                          `createTime` timestamp,
                                          primary key (`discussId`),
                                          foreign key (`knowledgeId`) references tb_knowledge(`knowledgeId`)
);

create table if not exists tb_question (
                                           `id` int not null auto_increment,
                                           `realName` varchar(255),
                                           `questioner` varchar(255),
                                           `phone` varchar(20) not null,
                                           `plantName` varchar(255) not null,
                                           `title` varchar(255) not null,
                                           `question` varchar(255),
                                           `answer` varchar(255),
                                           `status` int,
                                           primary key (`id`)
);

create table if not exists tb_expert (
                                         `userName` varchar(255) not null,
                                         `realName` varchar(255) not null,
                                         `phone` varchar(20) not null,
                                         `profession` varchar(255) not null,
                                         `position` varchar(255) not null,
                                         `belong` varchar(255) not null,
                                         primary key (`userName`)
);

create table if not exists tb_reserve (
                                          `id` int not null auto_increment,
                                          `expertName` varchar(255),
                                          `questioner` varchar(255),
                                          `area` varchar(255) not null ,
                                          `address` varchar(255) not null,
                                          `plantName` varchar(255) not null,
                                          `soilCondition` varchar(255) not null,
                                          `plantCondition` varchar(255) not null,
                                          `plantDetail` varchar(255) not null,
                                          `phone` varchar(20) not null,
                                          `message` varchar(255),
                                          `answer` varchar(255),
                                          `status` int,
                                          primary key (`id`)
);

create table if not exists tbShoppingcart (
                                               `shoppingId` int not null auto_increment,
                                               `orderId` int not null,
                                               `count` int,
                                               `ownName` varchar(255),
                                               `createTime` timestamp,
                                               `updateTime` timestamp,
                                               primary key (`shoppingId`),
                                               foreign key (`orderId`) references tb_order(`orderId`)
);

create table if not exists tb_bank (
                                       `bankId` int not null auto_increment,
                                       `bankName` varchar(255),
                                       `introduce` varchar(255),
                                       `bankPhone` varchar(255),
                                       `money` decimal(9,2),
                                       `rate` decimal(9,2),
                                       `repayment` int,
                                       primary key (`bankId`)
);

create table if not exists tb_finance (
                                          `financeId` int not null auto_increment,
                                          `bankId` int,
                                          `ownName` varchar(255),
                                          `realName` varchar(255),
                                          `status` int,
                                          `money` decimal(9,2) not null,
                                          `rate` decimal(9,2) not null,
                                          `repayment` int not null,
                                          `createTime` timestamp,
                                          `updateTime` timestamp,
                                          primary key (`financeId`),
                                          foreign key (`bankId`) references tb_bank(`bankId`)
);

create table if not exists tbPurchase (
                                           `purchaseId` int not null auto_increment,
                                           `ownName` varchar(255),
                                           `purchaseType` int,
                                           `totalPrice` decimal(9,2),
                                           `address` varchar(255),
                                           `purchaseStatus` int,
                                           `createTime` timestamp,
                                           `updateTime` timestamp,
                                           primary key (`purchaseId`)
);

create table if not exists tbPurchase_detail (
                                                  `detailId` int not null auto_increment,
                                                  `purchaseId` int,
                                                  `orderId` int,
                                                  `uninPrice` decimal(9,2),
                                                  `sumPrice` decimal(9,2),
                                                  `count` int,
                                                  primary key (`detailId`),
                                                  foreign key (`purchaseId`) references tbPurchase(`purchaseId`),
                                                  foreign key (`orderId`) references tb_order(`orderId`)
);

create table if not exists tbSellPurchase (
                                                `sellPurchaseId` int not null auto_increment,
                                                `purchaseId` int,
                                                `orderId` int,
                                                `ownName` varchar(255),
                                                `purchaseType` int,
                                                `uninPrice` decimal(9,2),
                                                `sumPrice` decimal(9,2),
                                                `address` varchar(255),
                                                `purchaseStatus` int,
                                                `createTime` timestamp,
                                                `updateTime` timestamp,
                                                `phone` varchar(20),
                                                primary key (`sellPurchaseId`),
                                                foreign key (`purchaseId`) references tbPurchase(`purchaseId`),
                                                foreign key (`orderId`) references tb_order(`orderId`)
);

create table if not exists tb_address (
                                          `id` int not null auto_increment,
                                          `ownName` varchar(255),
                                          `consignee` varchar(255),
                                          `phone` varchar(20),
                                          `addressDetail` varchar(255),
                                          `isDefault` int,
                                          primary key (`id`)
);
