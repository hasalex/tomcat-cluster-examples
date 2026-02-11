CREATE TABLE Message (
    id      INTEGER PRIMARY KEY,
    message VARCHAR(50),
    created DATE
);

INSERT INTO Message (id, message, created) 
  VALUES (0, 'Hello World', '2000-01-01'),
         (1, 'Allo la terre, ici Derby', '2001-01-01'),
         (2, 'JAAS is the way', '2002-01-01'),
         (3, 'And now for something completely different...', '2003-01-01');

CREATE TABLE SW_Users (
    userid        VARCHAR(64) NOT NULL PRIMARY KEY,
    passwd        VARCHAR(64),
    passwd_sha2   VARCHAR(196),
    passwd_pbkdf2 VARCHAR(128)
);

INSERT INTO SW_Users (userid, passwd, passwd_sha2, passwd_pbkdf2) 
  VALUES ('user0', 'pwd0', '4b68858a0241d9dc77c2cea0251888fddbff127ec425972dfd7a1f5b9545ae78$1$b92136492a16f4ec424b5db2d0c90693073ec858b2c1f9655e63e81020c97a63c94ea3f3f00dfdb5677467f197f913b8629d9e76365d3fbdcaeff31693b81587', 'c986fff97337c1386051a17824a8a7994fea523712a7b74d5ca7b201b6adea6a$100000$bab2222e763c5b194e0a045e762a146bfa2e5337'),
         ('user1', 'pwd1', '63655326528d646a337934c9bbbb398dea8e8e5987afb90e176001911ea8fc67$1$e74dc4ad4e609243ad85f94184c58371b5b60be00e7a50444ef93dff431f90eabdc937b70455b347f12b4ca272a0fb4b12525cdd5ac8b1aca10e33cdecfd0ba5', '165362397868f7e760af991e172459f52ba7993127e388b3d0d1753031135453$10000$3dc5b65c00adf99ea62b5e6ad971c402ae434a41'),
         ('user2', 'pwd2', '7632501caa13f89a062588651ea03f7805d50717f907ffa19587f64cabfcc176$1$23cb4f817247984214bb3bab0fbcda61c0c69fc232a630668806ef1040e6f4a0baa24e3e30690ec55cb469a2f39493d32e03880c4fb924cd13fff1efe69f838f', '2c00f3c244246dee8868296bcca8ac25ff2e50cf83ed9525d65ce2467abed988$10000$c03ec7c76b521d1be43776d22f3e86965699a65f'),
         ('alexis', 'hassler', 'a9657bcbd6156fa27ae0af804686b4ae53b9097ff694b8abf2b351170e2c2a6d$1$f6d94d0611d14e65a362cb072730d099b830e7bee42b6df268cab0fd2de6253d77001de16c482ff2f2cf05a4207238e1c82c436e2faf09c1bedc82c942d21db8', 'f9a2d5a55c6db4a072614ac34f512da0cf1d3152d4ea10bc66e81003bcd567a2$10000$7cbe25bab27e14df099de9537799d1a5a8c05407');

CREATE TABLE SW_Roles (
    userid VARCHAR(64),
    roleid VARCHAR(64)
);

INSERT INTO SW_Roles (userid, roleid) 
  VALUES ('alexis', 'sw-webuser'),
         ('alexis', 'sw-ejbuser'),
         ('alexis', 'sw-wsuser'),
         ('user0', 'sw-webuser'),
         ('user0', 'sw-ejbuser'),
         ('user1', 'sw-webuser');
