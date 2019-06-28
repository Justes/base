alter table w_users 
add usercode char(32) not null default '' comment '用户编号' after password,
add fd int default 0 comment '用户连接' after usercode;

create table w_user_friends (
	id int AUTO_INCREMENT primary key,
	user_id int default 0,
	usercode char(32) default '' comment '用户编号',
	friend_id int default 0,
	friendcode char(32) default '' comment '好友编号',
	created_at datetime DEFAULT NULL COMMENT '创建时间',
	updated_at datetime DEFAULT NULL COMMENT '更新时间'
) comment '用户好友表';

create table w_messages (
	id int AUTO_INCREMENT primary key,
	from_usercode char(32) default '' comment '发出者',
	to_usercode char(32) default '' comment '接受者',
	message varchar(255) default '' comment '消息',
	send tinyint default 0 comment '是否成功发出',
	created_at datetime DEFAULT NULL COMMENT '创建时间',
	updated_at datetime DEFAULT NULL COMMENT '更新时间'
) comment '消息表';
