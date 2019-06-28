alter table w_users 
add fd int default 0 comment '用户连接' after password;

create table w_user_friends (
	id int AUTO_INCREMENT primary key,
	user_id int default 0,
	friend_id int default 0,
	created_at datetime DEFAULT NULL COMMENT '创建时间',
	updated_at datetime DEFAULT NULL COMMENT '更新时间'
) comment '用户好友表';

create table w_messages (
	id int AUTO_INCREMENT primary key,
	from_uid char(32) default '' comment '发出者',
	to_uid char(32) default '' comment '接受者',
	msg varchar(255) default '' comment '消息',
	send tinyint default 0 comment '是否发出',
	created_at datetime DEFAULT NULL COMMENT '创建时间',
	updated_at datetime DEFAULT NULL COMMENT '更新时间'
) comment '消息表';
