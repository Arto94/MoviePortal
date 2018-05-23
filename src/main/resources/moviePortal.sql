/*
SQLyog Ultimate v12.09 (64 bit)
MySQL - 5.7.20-log : Database - movie_portal
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`movie_portal` /*!40100 DEFAULT CHARACTER SET utf8 */;

USE `movie_portal`;

/*Table structure for table `actor` */

DROP TABLE IF EXISTS `actor`;

CREATE TABLE `actor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `city` varchar(255) NOT NULL,
  `birthday` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `actor` */

insert  into `actor`(`id`,`name`,`surname`,`age`,`nationality`,`pic`,`description`,`city`,`birthday`) values (7,'Al','Pacino',78,'USA','1521197952278_AlPacino.jpg','One of the greatest actors in all of film history, Al Pacino established himself during one of film\'s greatest decades, the 1970s, and has become an enduring and iconic figure in the world of American movies.  Alfredo James Pacino was born on April 25, 1940, in the Bronx, New York, to an Italian-American family. His parents, Rose (Gerardi) and Sal Pacino, divorced when he was young. His mother moved them into his grandparents\' house. Pacino found himself often repeating the plots and voices of characters he had seen in the movies, one of his favorite activities. Bored and unmotivated in school, the young Al Pacino found a haven in school plays, and his interest soon blossomed into a full-time career. Starting on the stage, he went through a lengthy period of depression and poverty, sometimes having to borrow bus fare to succeed to auditions. He made it into the prestigious Actors Studio in 1966, studying under legendary acting coach Lee Strasberg, creator of the Method Approach that would become the trademark of many 1970s-era actors.','Manhattan, New York','April 25 1940'),(8,'Robert','De Niro',74,'USA','1521198039973_robertDeNiro.jpg','One of the greatest actors of all time, Robert De Niro was born on August 17, 1943 in Manhattan, New York City, to artists Virginia (Admiral) and Robert De Niro Sr. His paternal grandfather was of Italian descent, and his other ancestry is English, Dutch, German, French and Irish. He was trained at the Stella Adler Conservatory and the American Workshop. De Niro first gained fame for his role in &#1041;&#1077;&#1081; &#1074; &#1073;&#1072;&#1088;&#1072;&#1073;&#1072;&#1085; &#1084;&#1077;&#1076;&#1083;&#1077;&#1085;&#1085;&#1086; (1973), but he gained his reputation as a volatile actor in &#1047;&#1083;&#1099;&#1077; &#1091;&#1083;&#1080;&#1094;&#1099; (1973), which was his first film with director Martin Scorsese. He received an Academy Award for Best Supporting Actor for his role in &#1050;&#1088;&#1105;&#1089;&#1090;&#1085;&#1099;&#1081; &#1086;&#1090;&#1077;&#1094; 2 (1974) and received Academy Award nominations for best actor in &#1058;&#1072;&#1082;&#1089;&#1080;&#1089;&#1090; (1976), &#1054;&#1093;&#1086;&#1090;&#1085;&#1080;&#1082; &#1085;&#1072; &#1086;&#1083;&#1077;&#1085;&#1077;&#1081; (1978) and &#1052;&#1099;&#1089; &#1089;&#1090;&#1088;&#1072;&#1093;&#1072; (1991). He received the Academy Award for Best Actor for his role as Jake LaMotta in &#1041;&#1077;&#1096;&#1077;&#1085;&#1099;&#1081; &#1073;&#1099;&#1082; (1980).  De Niro has earned four Golden Globe Award nominations for Best Actor - Motion Picture Musical or Comedy, for his work in &#1053;&#1100;&#1102;-&#1049;&#1086;&#1088;&#1082;, &#1053;&#1100;&#1102;-&#1049;&#1086;&#1088;&#1082; (1977), opposite Liza Minnelli, &#1059;&#1089;&#1087;&#1077;&#1090;&#1100; &#1076;&#1086; &#1087;&#1086;&#1083;&#1091;&#1085;&#1086;&#1095;&#1080; (1988), &#1040;&#1085;&#1072;&#1083;&#1080;&#1079;&#1080;&#1088;&#1091;&#1081; &#1101;&#1090;&#1086; (1999) and &#1047;&#1085;&#1072;&#1082;&#1086;&#1084;&#1089;&#1090;&#1074;&#1086; &#1089; &#1088;&#1086;&#1076;&#1080;&#1090;&#1077;&#1083;&#1103;&#1084;&#1080; (2000). Other notable performances include &#1041;&#1088;&#1072;&#1079;&#1080;&#1083;&#1080;&#1103; (1985), &#1053;&#1077;&#1087;&#1088;&#1080;&#1082;&#1072;&#1089;&#1072;&#1077;&#1084;&#1099;&#1077; (1987), &#1054;&#1073;&#1088;&#1072;&#1090;&#1085;&#1072;&#1103; &#1090;&#1103;&#1075;&#1072; (1991), &#1060;&#1088;&#1072;&#1085;&#1082;&#1077;&#1085;&#1096;&#1090;&#1077;&#1081;&#1085; (1994), &#1057;&#1093;&#1074;&#1072;&#1090;&#1082;&#1072; (1995), &#1050;&#1072;&#1079;&#1080;&#1085;&#1086; (1995) and &#1044;&#1078;&#1077;&#1082;&#1080; &#1041;&#1088;&#1072;&#1091;&#1085; (1997). At the same time, he also directed and starred in such films as &#1041;&#1088;&#1086;&#1085;&#1082;&#1089;&#1082;&#1072;&#1103; &#1080;&#1089;&#1090;&#1086;&#1088;&#1080;&#1103; (1993) and &#1051;&#1086;&#1078;&#1085;&#1086;&#1077; &#1080;&#1089;&#1082;&#1091;&#1096;&#1077;&#1085;&#1080;&#1077; (2006). De Niro has also received the AFI Lifetime Achievement Award in 2003 and the Golden Globe Cecil B. DeMille Award in 2010.','New York','August 17, 1943'),(9,'Brad ','Pitt',52,'USA','1521198136976_Brad.jpg','An actor and producer known as much for his versatility as he is for his handsome face, Golden Globe-winner Brad Pitt\'s most widely recognized role may be Tyler Durden in &#1041;&#1086;&#1081;&#1094;&#1086;&#1074;&#1089;&#1082;&#1080;&#1081; &#1082;&#1083;&#1091;&#1073; (1999). However, his portrayals of Billy Beane in &#1063;&#1077;&#1083;&#1086;&#1074;&#1077;&#1082;, &#1082;&#1086;&#1090;&#1086;&#1088;&#1099;&#1081; &#1080;&#1079;&#1084;&#1077;&#1085;&#1080;&#1083; &#1074;c&#1105; (2011), and Rusty Ryan in the remake of &#1054;&#1076;&#1080;&#1085;&#1085;&#1072;&#1076;&#1094;&#1072;&#1090;&#1100; &#1076;&#1088;&#1091;&#1079;&#1077;&#1081; &#1054;&#1091;&#1096;&#1077;&#1085;&#1072; (2001) and its sequels, also loom large in his filmography.  Pitt was born William Bradley Pitt on December 18th, 1963, in Shawnee, Oklahoma, and was raised in Springfield, Missouri. He is the son of Jane Etta (Hillhouse), a school counselor, and William Alvin Pitt, a truck company manager. He has a younger brother, Douglas (Doug) Pitt, and a younger sister, Julie Neal Pitt. At Kickapoo High School, Pitt was involved in sports, debating, student government and school musicals. Pitt attended the University of Missouri, where he majored in journalism with a focus on advertising. He occasionally acted in fraternity shows. He left college two credits short of graduating to move to California. Before he became successful at acting, Pitt supported himself by driving strippers in limos, moving refrigerators and dressing as a giant chicken while working for \"el Pollo Loco\".  Pitt\'s earliest credited roles were in television, starting on the daytime soap opera Another World (1964) before appearing in the recurring role of Randy on the legendary prime time soap opera &#1044;&#1072;&#1083;&#1083;&#1072;&#1089; (1978). Following a string of guest appearances on various television series through the 1980s, Pitt gained widespread attention with a small part in &#1058;&#1077;&#1083;&#1100;&#1084;&#1072; &#1080; &#1051;&#1091;&#1080;&#1079;&#1072; (1991), in which he played a sexy criminal who romanced and conned Geena Davis. This lead to starring roles in badly received films such as &#1044;&#1078;&#1086;&#1085;&#1085;&#1080;-&#1079;&#1072;&#1084;&#1096;&#1072; (1991) and &#1055;&#1072;&#1088;&#1072;&#1083;&#1083;&#1077;&#1083;&#1100;&#1085;&#1099;&#1081; &#1084;&#1080;&#1088; (1992).','Oklahoma','December 18, 1963'),(10,'Anthony','Hopkins',80,'UK','1521198240382_Anthony.jpg','Anthony Hopkins was born on December 31, 1937, in Margam, Wales, to Muriel Anne (Yeats) and Richard Arthur Hopkins, a baker. His parents were both of half Welsh and half English descent. Influenced by Richard Burton, he decided to study at College of Music and Drama and graduated in 1957. In 1965, he moved to London and joined the National Theatre, invited by Laurence Olivier, who could see the talent in Hopkins. In 1967, he made his first film for television, A Flea in Her Ear (1967).','Wales','December 31, 1937'),(11,'Denzel','Washington',73,'USA','1521198355656_Denze.jpg','Denzel Hayes Washington, Jr. was born on December 28, 1954 in Mount Vernon, New York. He is the middle of three children of a beautician mother, Lennis, from Georgia, and a Pentecostal minister father, Denzel Washington, Sr., from Virginia. After graduating from high school, Denzel enrolled at Fordham University, intent on a career in journalism. However, he caught the acting bug while appearing in student drama productions and, upon graduation, he moved to San Francisco and enrolled at the American Conservatory Theater. He left A.C.T. after only one year to seek work as an actor. His first paid acting role was in a summer stock theater stage production in St. Mary\'s City, Maryland. The play was \"Wings of the Morning\", which is about the founding of the colony of Maryland (now the state of Maryland) and the early days of the Maryland colonial assembly (a legislative body). He played the part of a real historical character, Mathias Da Sousa, although much of the dialogue was created. Afterwards he began to pursue screen roles in earnest. With his acting versatility and powerful presence, he had no difficulty finding work in numerous television productions.  He made his first big screen appearance in &#1058;&#1086;&#1095;&#1085;&#1072;&#1103; &#1082;&#1086;&#1087;&#1080;&#1103; (1981) with George Segal. Through the 1980s, he worked in both movies and television and was chosen for the plum role of Dr. Philip Chandler in NBC\'s hit medical series &#1057;&#1077;&#1085;&#1090;-&#1069;&#1083;&#1089;&#1074;&#1077;&#1088; (1982), a role that he would play for six years. In 1989, his film career began to take precedence when he won the Oscar for Best Supporting Actor for his portrayal of Tripp, the runaway slave in Edward Zwick\'s powerful historical masterpiece &#1044;&#1086;&#1073;&#1083;&#1077;&#1089;&#1090;&#1100; (1989).','New York','December 28, 1954'),(12,'Leonardo','DiCaprio',43,'USA','1521198628366_Leo.jpg','Leonardo Wilhelm DiCaprio ; born November 11, 1974) is an American actor, film producer, and environmental activist.[2] DiCaprio began his career by appearing in television commercials in the late 1980s, after which he had recurring roles in various television series such as the soap opera Santa Barbara and the sitcom Growing Pains. He began his film career by starring as Josh in Critters 3 (1991). He starred in the film adaptation of the memoir This Boy\'s Life (1993), and was praised for his supporting role in What\'s Eating Gilbert Grape (1993). He gained public recognition with leading roles in The Basketball Diaries (1995) and the romantic drama Romeo + Juliet (1996), before achieving international fame with James Cameron\'s epic romance Titanic (1997), which became the highest-grossing film of all time to that point.\r\n\r\nSince 2000, DiCaprio has received critical acclaim for his work in a wide range of film genres. DiCaprio\'s subsequent films include The Man in the Iron Mask (1998), the biographical crime drama Catch Me If You Can (2002), and the epic historical drama Gangs of New York (2002), which marked his first of many collaborations with director Martin Scorsese. He was acclaimed for his performances in the political war thriller Blood Diamond (2006), the neo-noir crime drama The Departed (2006), the espionage thriller Body of Lies (2008), the drama Revolutionary Road (2008), the psychological thriller Shutter Island (2010), the science fiction thriller Inception (2010), the biographical film J. Edgar (2011), the western Django Unchained (2012), and the period drama The Great Gatsby (2013).\r\n\r\nDiCaprio\'s portrayals of Howard Hughes in The Aviator (2004) and Hugh Glass in The Revenant (2015) won him the Golden Globe Award for Best Actor – Motion Picture Drama, and his role as Jordan Belfort in The Wolf of Wall Street (2013) won him the award for Best Actor – Motion Picture Musical or Comedy. He also won the Academy Award for Best Actor and BAFTA Award for his performance in The Revenant. DiCaprio is the founder of his own production company, Appian Way Productions.','Los Angeles, California','November 11, 1974'),(13,'Mel','Gibson',62,'USA','1521198724166_Mel.jpg','Mel Columcille Gerard Gibson was born January 3, 1956 in Peekskill, New York, USA, as the sixth of eleven children of Hutton Gibson, a railroad brakeman, and Anne Patricia (Reilly) Gibson (who died in December of 1990). His mother was Irish, from County Longford, while his American-born father is of mostly Irish descent. Mel and his family moved to Australia in the late 1960s, settling in New South Wales, where Mel\'s paternal grandmother, contralto opera singer Eva Mylott, was born. After high school, Mel studied at the University of New South Wales in Sydney, performing at the National Institute of Dramatic Arts alongside future film thespians Judy Davis and Geoffrey Rush. After college, Mel had a few stints on stage and starred in a few TV shows. Eventually, he was chosen to star in the films &#1041;&#1077;&#1079;&#1091;&#1084;&#1085;&#1099;&#1081; &#1052;&#1072;&#1082;&#1089; (1979) and &#1058;&#1080;&#1084; (1979), co-starring Piper Laurie. The small budgeted Mad Max made him known worldwide, while Tim garnered him an award for Best Actor from the Australian Film Institute (equivalent to the Oscar). Later, he went on to star in &#1043;&#1072;&#1083;&#1083;&#1080;&#1087;&#1086;&#1083;&#1080; (1981), which earned him a second award for Best Actor from the AFI. In 1980, he married Robyn Moore and had seven children. In 1984, Mel made his American debut in &#1041;&#1072;&#1091;&#1085;&#1090;&#1080; (1984), which co-starred Anthony Hopkins. Then in 1987, Mel starred in what would become his signature series, &#1057;&#1084;&#1077;&#1088;&#1090;&#1077;&#1083;&#1100;&#1085;&#1086;&#1077; &#1086;&#1088;&#1091;&#1078;&#1080;&#1077; (1987), in which he played \"Martin Riggs\". In 1990, he took on the interesting starring role in &#1043;&#1072;&#1084;&#1083;&#1077;&#1090; (1990), which garnered him some critical praise. He also made the more endearing &#1042;&#1077;&#1095;&#1085;&#1086; &#1084;&#1086;&#1083;&#1086;&#1076;&#1086;&#1081; (1992) and the somewhat disturbing &#1063;e&#1083;&#1086;&#1074;&#1077;&#1082; &#1073;&#1077;&#1079; &#1083;&#1080;&#1094;&#1072; (1993). 1995 brought his most famous role as \"Sir William Wallace\" in &#1061;&#1088;&#1072;&#1073;&#1088;&#1086;&#1077; &#1089;&#1077;&#1088;&#1076;&#1094;&#1077; (1995), for which he won two Oscars for Best Picture and Best Director. From there, he made such box office hits as &#1055;&#1072;&#1090;&#1088;&#1080;&#1086;&#1090; (2000), &#1042;&#1099;&#1082;&#1091;&#1087; (1996), and &#1056;&#1072;&#1089;&#1087;&#1083;&#1072;&#1090;&#1072; (1999). Today, Mel remains an international superstar mogul, continuously topping the Hollywood power lists as well as the Most Beautiful and Sexiest lists.','New York','January 3, 1956'),(14,'Samuel','Jackson',69,'USA','1521198811280_Samuel.jpg','Samuel L. Jackson is an American producer and highly prolific actor, having appeared in over 100 films, including &#1050;&#1088;&#1077;&#1087;&#1082;&#1080;&#1081; &#1086;&#1088;&#1077;&#1096;&#1077;&#1082; 3 (1995), &#1053;&#1077;&#1091;&#1103;&#1079;&#1074;&#1080;&#1084;&#1099;&#1081; (2000), &#1044;&#1077;&#1090;&#1077;&#1082;&#1090;&#1080;&#1074; &#1064;&#1072;&#1092;&#1090; (2000), &#1060;&#1086;&#1088;&#1084;&#1091;&#1083;&#1072; 51 (2001), &#1057;&#1090;&#1086;&#1085; &#1095;&#1077;&#1088;&#1085;&#1086;&#1081; &#1079;&#1084;&#1077;&#1080; (2006), &#1047;&#1084;&#1077;&#1080;&#1085;&#1099;&#1081; &#1087;&#1086;&#1083;&#1077;&#1090; (2006), and the Star Wars prequel trilogy (1999-2005), as well as the Marvel Cinematic Universe.  Samuel Leroy Jackson was born in Washington, D.C., to Elizabeth (Montgomery) and Roy Henry Jackson. He was raised by his mother, a factory worker. Jackson was active in the black student movement. In the seventies, he joined the Negro Ensemble Company (together with Morgan Freeman). In the eighties, he became well-known after three movies made by Spike Lee: &#1044;&#1077;&#1083;&#1072;&#1081; &#1082;&#1072;&#1082; &#1085;&#1072;&#1076;&#1086; (1989), &#1041;&#1083;&#1102;&#1079; &#1086; &#1083;&#1091;&#1095;&#1096;&#1077;&#1081; &#1078;&#1080;&#1079;&#1085;&#1080; (1990) and &#1051;&#1080;&#1093;&#1086;&#1088;&#1072;&#1076;&#1082;&#1072; &#1076;&#1078;&#1091;&#1085;&#1075;&#1083;&#1077;&#1081; (1991). He achieved prominence and critical acclaim in the early 1990s with films such as &#1048;&#1075;&#1088;&#1099; &#1087;&#1072;&#1090;&#1088;&#1080;&#1086;&#1090;&#1086;&#1074; (1992), &#1069;&#1084;&#1086;&#1089; &#1080; &#1069;&#1085;&#1076;&#1088;&#1102; (1993), &#1053;&#1072;&#1089;&#1090;&#1086;&#1103;&#1097;&#1072;&#1103; &#1083;&#1102;&#1073;&#1086;&#1074;&#1100; (1993), &#1055;&#1072;&#1088;&#1082; &#1102;&#1088;&#1089;&#1082;&#1086;&#1075;&#1086; &#1087;&#1077;&#1088;&#1080;&#1086;&#1076;&#1072; (1993), and his collaborations with director Quentin Tarantino, including &#1050;&#1088;&#1080;&#1084;&#1080;&#1085;&#1072;&#1083;&#1100;&#1085;&#1086;&#1077; &#1095;&#1090;&#1080;&#1074;&#1086; (1994), &#1044;&#1078;&#1077;&#1082;&#1080; &#1041;&#1088;&#1072;&#1091;&#1085; (1997), and later &#1044;&#1078;&#1072;&#1085;&#1075;&#1086; &#1086;&#1089;&#1074;&#1086;&#1073;&#1086;&#1078;&#1076;&#1077;&#1085;&#1085;&#1099;&#1081; (2012). Going from supporting player to leading man, his performance in &#1050;&#1088;&#1080;&#1084;&#1080;&#1085;&#1072;&#1083;&#1100;&#1085;&#1086;&#1077; &#1095;&#1090;&#1080;&#1074;&#1086; (1994) gave him an Oscar nomination for his character Jules Winnfield, and he received a Silver Berlin Bear for his part as Ordell Robbi in &#1044;&#1078;&#1077;&#1082;&#1080; &#1041;&#1088;&#1072;&#1091;&#1085; (1997). Jackson usually played bad guys and drug addicts before becoming an action hero, co-starring with Bruce Willis in &#1050;&#1088;&#1077;&#1087;&#1082;&#1080;&#1081; &#1086;&#1088;&#1077;&#1096;&#1077;&#1082; 3 (1995) and Geena Davis in &#1044;&#1086;&#1083;&#1075;&#1080;&#1081; &#1087;&#1086;&#1094;&#1077;&#1083;&#1091;&#1081; &#1085;&#1072; &#1085;&#1086;&#1095;&#1100; (1996).','Washington','December 21, 1948'),(15,'Nicolas','Cage',54,'USA','1521198895455_Nicolas.jpg','Nicolas Cage was born Nicolas Kim Coppola in Long Beach, California, the son of comparative literature professor August Coppola (whose brother is director Francis Ford Coppola) and dancer/choreographer Joy Vogelsang. He is of Italian (father) and Polish, German, and English (mother) descent. Cage changed his name early in his career to make his own reputation, succeeding brilliantly with a host of classic, quirky roles by the late 1980s.  Initially studying theatre at Beverly Hills High School (though he dropped out at seventeen), he secured a bit part in &#1041;&#1077;&#1089;&#1087;&#1077;&#1095;&#1085;&#1099;&#1077; &#1074;&#1088;&#1077;&#1084;&#1077;&#1085;&#1072; &#1074; &#1056;&#1080;&#1076;&#1078;&#1084;&#1086;&#1085;&#1090; &#1061;&#1072;&#1081; (1982) -- most of which was cut, dashing his hopes and leading to a job selling popcorn at the Fairfax Theater, thinking that would be the only route to a movie career. But a job reading lines with actors auditioning for uncle Francis\' &#1041;&#1086;&#1081;&#1094;&#1086;&#1074;&#1072;&#1103; &#1088;&#1099;&#1073;&#1082;&#1072; (1983) landed him a role in that film, followed by the punk-rocker in &#1044;&#1077;&#1074;&#1091;&#1096;&#1082;&#1072; &#1080;&#1079; &#1076;&#1086;&#1083;&#1080;&#1085;&#1099; (1983), which was released first and truly launched his career.','Long Beach, California','January 7, 1964'),(16,'Morgan','Freeman',80,'USA','1521198976261_Morgan.jpg','With an authoritative voice and calm demeanor, this ever popular American actor has grown into one of the most respected figures in modern US cinema. Morgan was born on June 1, 1937 in Memphis, Tennessee, to Mayme Edna (Revere), a teacher, and Morgan Porterfield Freeman, a barber. The young Freeman attended Los Angeles City College before serving several years in the US Air Force as a mechanic between 1955 and 1959. His first dramatic arts exposure was on the stage including appearing in an all-African American production of the exuberant musical Hello, Dolly!.  Throughout the 1970s, he continued his work on stage, winning Drama Desk and Clarence Derwent Awards and receiving a Tony Award nomination for his performance in The Mighty Gents in 1978. In 1980, he won two Obie Awards, for his portrayal of Shakespearean anti-hero Coriolanus at the New York Shakespeare Festival and for his work in Mother Courage and Her Children. Freeman won another Obie in 1984 for his performance as The Messenger in the acclaimed Brooklyn Academy of Music production of Lee Breuer\'s The Gospel at Colonus and, in 1985, won the Drama-Logue Award for the same role. In 1987, Freeman created the role of Hoke Coleburn in Alfred Uhry\'s Pulitzer Prize-winning play Driving Miss Daisy, which brought him his fourth Obie Award. In 1990, Freeman starred as Petruchio in the New York Shakespeare Festival\'s The Taming of the Shrew, opposite Tracey Ullman. Returning to the Broadway stage in 2008, Freeman starred with Frances McDormand and Peter Gallagher in Clifford Odets\' drama The Country Girl, directed by Mike Nichols.','Memphis, Tennessee','June 1, 1937'),(17,'Russel','Crowe',54,'New Zealand','1521199072842_Rossel.jpg','Russell Ira Crowe was born in Wellington, New Zealand, to Jocelyn Yvonne (Wemyss) and John Alexander Crowe, both of whom catered movie sets. His maternal grandfather, Stanley Wemyss, was a cinematographer. Crowe\'s recent ancestry includes Welsh (where his paternal grandfather was born, in Wrexham), English, Irish, Scottish, Norwegian, Swedish, and Maori (one of Crowe\'s maternal great-grandmothers, Erana Putiputi Hayes Heihi, was Maori).  Crowe\'s family moved to Australia when he was a small child, and Russell got the acting bug early in life. Beginning as a child star on a local Australian TV show, Russell\'s first big break came with two films ... the first, &#1057;&#1082;&#1080;&#1085;&#1099; (1992), gained him a name throughout the film community in Australia and the neighboring countries. The second, &#1063;&#1077;&#1075;&#1086; &#1084;&#1099; &#1089;&#1090;&#1086;&#1080;&#1084; &#1074; &#1078;&#1080;&#1079;&#1085;&#1080; (1994), helped put him on the American map, so to speak. Sharon Stone heard of him from &#1057;&#1082;&#1080;&#1085;&#1099; (1992) and wanted him for her film, &#1041;&#1099;&#1089;&#1090;&#1088;&#1099;&#1081; &#1080; &#1084;&#1105;&#1088;&#1090;&#1074;&#1099;&#1081; (1995). But filming on &#1063;&#1077;&#1075;&#1086; &#1084;&#1099; &#1089;&#1090;&#1086;&#1080;&#1084; &#1074; &#1078;&#1080;&#1079;&#1085;&#1080; (1994) had already begun. Sharon is reported to have held up shooting until she had her gunslinger-Crowe, for her film. With &#1041;&#1099;&#1089;&#1090;&#1088;&#1099;&#1081; &#1080; &#1084;&#1105;&#1088;&#1090;&#1074;&#1099;&#1081; (1995) under his belt as his first American film, the second was offered to him soon after. &#1042;&#1080;p&#1090;&#1091;&#1086;&#1079;&#1085;&#1086;&#1089;&#1090;&#1100; (1995), starring Denzel Washington, put Russell in the body of a Virtual Serial Killer, Sid6.7 ... a role unlike any he had played so far. &#1042;&#1080;p&#1090;&#1091;&#1086;&#1079;&#1085;&#1086;&#1089;&#1090;&#1100; (1995), a Sci-Fi extravaganza, was a fun film and, again, opened the door to even more American offers. &#1057;&#1077;&#1082;&#1088;&#1077;&#1090;&#1099; &#1051;&#1086;&#1089;-&#1040;&#1085;&#1076;&#1078;&#1077;&#1083;&#1077;&#1089;&#1072; (1997), Russell\'s third American film, brought him the US fame and attention that his fans have felt he deserved all along. Missing the Oscar nod this time around, he didn\'t seem deterred and signed to do his first film with The Walt Disney Company, &#1058;&#1072;&#1081;&#1085;&#1072; &#1040;&#1083;&#1103;&#1089;&#1082;&#1080; (1999). He achieved even more success and awards for his performances in &#1043;&#1083;&#1072;&#1076;&#1080;&#1072;&#1090;&#1086;&#1088; (2000) and &#1048;&#1075;&#1088;&#1099; &#1088;&#1072;&#1079;&#1091;&#1084;&#1072; (2001).','Wellington','April 7, 1964'),(18,'Bruce','Willis',63,'West-Germany','1521199210428_Bruce.jpg','Walter Bruce Willis[1] was born on March 19, 1955, in the town of Idar-Oberstein, West Germany.[2][3][4] His father, David Willis, was an American soldier. His mother, Marlene,[5] was German, born in Kassel.[2][3] Willis is the oldest of four children with a sister named Florence and two brothers, Robert (who is deceased) and David.[6]  After being discharged from the military in 1957, Willis\'s father took his family back to Carneys Point Township, New Jersey.[7] Willis has described himself as having come from a \"long line of blue collar people\".[7] His mother worked in a bank and his father was a welder, master mechanic, and factory worker.[1] Willis attended Penns Grove High School in his hometown, where he encountered issues with a stutter.[7] He was nicknamed \"Buck-Buck\" by his schoolmates.[1][8][9] Finding it easy to express himself on stage and losing his stutter in the process, Willis began performing on stage; his high school activities were marked by such things as the drama club and being student council president.[1]  After he graduated from high school in 1973, Willis took a job as a security guard at the Salem Nuclear Power Plant[10][11] and transported work crews at the DuPont Chambers Works factory in Deepwater, New Jersey.[11] After working as a private investigator (a role he would play in the television series Moonlighting and the 1991 film The Last Boy Scout), Willis turned to acting. He enrolled in the Drama Program at Montclair State University, where he was cast in the class production of Cat on a Hot Tin Roof. Willis left school in his junior year in 1977 and moved to New York City,[3] where in the early 1980s he supported himself as a bartender at the West 19th Street art bar Kamikaze.[12] He performed as an extra in Paul Newman\'s closing summation scene in The Verdict in 1982.','Idar-Oberstein','March 19, 1955'),(19,'Johnny','Depp',51,'USA','1521199325977_Johnn.jpg',' He was born John Christopher Depp II in Owensboro, Kentucky, on June 9, 1963, to Betty Sue (Wells), who worked as a waitress, and John Christopher Depp, a civil engineer.  Depp was raised in Florida. He dropped out of school when he was 15, and fronted a series of music-garage bands, including one named \'The Kids\'. However, it was when he married Lori Anne Allison (Lori A. Depp) that he took up the job of being a ballpoint-pen salesman to support himself and his wife. A visit to Los Angeles, California, with his wife, however, happened to be a blessing in disguise, when he met up with actor Nicolas Cage, who advised him to turn to acting, which culminated in Depp\'s film debut in the low-budget horror film, &#1050;&#1086;&#1096;&#1084;&#1072;&#1088; &#1085;&#1072; &#1091;&#1083;&#1080;&#1094;&#1077; &#1042;&#1103;&#1079;&#1086;&#1074; (1984), where he played a teenager who falls prey to dream-stalking demon Freddy Krueger.','Kentucky','June 9, 1967'),(20,'Tom','Cruise',55,'USA','1521199436425_Tom.jpg','In 1976, if you had told fourteen year-old Franciscan seminary student Thomas Cruise Mapother IV that one day in the not too distant future he would be Tom Cruise, one of the top 100 movie stars of all time, he would have probably grinned and told you that his ambition was to join the priesthood. Nonetheless, this sensitive, deeply religious youngster who was born in 1962 in Syracuse, New York, was destined to become one of the highest paid and most sought after actors in screen history.  Tom is the only son (among four children) of nomadic parents, Mary Lee (Pfeiffer), a special education teacher, and Thomas Cruise Mapother III, an electrical engineer. His parents were both from Louisville, Kentucky, and he has German, Irish, and English ancestry. Young Tom spent his boyhood always on the move, and by the time he was 14 he had attended 15 different schools in the U.S. and Canada. He finally settled in Glen Ridge, New Jersey, with his mother and her new husband. While in high school, he developed an interest in acting and abandoned his plans of becoming a priest, dropped out of school, and at age 18 headed for New York and a possible acting career. The next 15 years of his life are the stuff of legends. He made his film debut with a small part in &#1041;&#1077;&#1089;&#1082;&#1086;&#1085;&#1077;&#1095;&#1085;&#1072;&#1103; &#1083;&#1102;&#1073;&#1086;&#1074;&#1100; (1981) and from the outset exhibited an undeniable box office appeal to both male and female audiences.','New York','July 3, 1962'),(21,'Christian','Bale',44,'UK','1521199523659_Bale.jpg','Christian Charles Philip Bale was born in Pembrokeshire, Wales, UK on January 30, 1974, to English parents Jennifer \"Jenny\" (James) and David Charles Howard Bale. His mother was a circus performer and his father, who was born in South Africa, was a commercial pilot. The family lived in different countries throughout Bale\'s childhood, including England, Portugal, and the United States. Bale acknowledges the constant change was one of the influences on his career choice.  His first acting job was a cereal commercial in 1983; amazingly, the next year, he debuted on the West End stage in \"The Nerd\". A role in the 1986 NBC mini-series &#1040;&#1085;&#1072;&#1089;&#1090;&#1072;&#1089;&#1080;&#1103;: &#1058;&#1072;&#1081;&#1085;&#1072; &#1040;&#1085;&#1085;&#1099; (1986) caught Steven Spielberg\'s eye, leading to Bale\'s well-documented role in &#1048;&#1084;&#1087;&#1077;&#1088;&#1080;&#1103; &#1057;&#1086;&#1083;&#1085;&#1094;&#1072; (1987). For the range of emotions he displayed as the star of the war epic, he earned a special award by the National Board of Review for Best Performance by a Juvenile Actor.','Wales','January 30, 1974'),(22,'Tim','Robbins',59,'USA','1521202069856_TimR.jpg','Robbins was born in West Covina, California, and raised in New York City. He is the son of Mary Cecelia (née Bledsoe; c. 1933–2011),[5] an actress, and Gilbert Lee Robbins (1931–2011),[6] a musician, folk singer, actor, and former manager of The Gaslight Cafe.[7][8][9] Robbins has two sisters, Adele and Gabrielle, and a brother, David. He was raised Catholic.[10][11]\r\n\r\nHe moved to Greenwich Village with his family at a young age, while his father pursued a career as a member of the folk music group, The Highwaymen. Robbins started performing in theater at age twelve and joined the drama club at Stuyvesant High School (Class of 1976).[12] He spent two years at SUNY Plattsburgh and then returned to California to study at the UCLA Film School, graduating with a Bachelor of Arts degree in Drama in 1981\r\n','West Covina, California','October 16, 1958');

/*Table structure for table `actor_movie` */

DROP TABLE IF EXISTS `actor_movie`;

CREATE TABLE `actor_movie` (
  `actor_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`actor_id`,`movie_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `actor_movie_ibfk_1` FOREIGN KEY (`actor_id`) REFERENCES `actor` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `actor_movie_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `actor_movie` */

insert  into `actor_movie`(`actor_id`,`movie_id`) values (16,8),(22,8),(9,9),(11,9),(12,9),(16,10),(20,10),(21,10),(9,11),(16,11),(21,11),(13,12),(14,12),(15,12),(17,12),(18,12),(8,13),(16,13),(19,13),(11,14),(15,14),(18,14),(10,16);

/*Table structure for table `bad_word` */

DROP TABLE IF EXISTS `bad_word`;

CREATE TABLE `bad_word` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `word` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

/*Data for the table `bad_word` */

insert  into `bad_word`(`id`,`word`) values (1,'qunem'),(2,'koxem'),(3,'gandon');

/*Table structure for table `blog` */

DROP TABLE IF EXISTS `blog`;

CREATE TABLE `blog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `date` varchar(255) NOT NULL,
  `picture` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

/*Data for the table `blog` */

insert  into `blog`(`id`,`name`,`description`,`date`,`picture`) values (6,'�&#1054;&#1089;&#1082;&#1072;&#1088;-2018� &#1085;&#1072; &#1050;&#1080;&#1085;&#1086;&#1055;&#1086;&#1080;&#1089;&#1082;&#1077;: &#1082;&#1086;&#1075;&#1076;&#1072; &#1080; &#1082;&#1072;&#1082; &#1089;&#1084;&#1086;&#1090;&#1088;&#1077;&#1090;&#1100;','&#1055;&#1088;&#1103;&#1084;&#1072;&#1103; &#1090;&#1088;&#1072;&#1085;&#1089;&#1083;&#1103;&#1094;&#1080;&#1103; &#1085;&#1072;&#1095;&#1085;&#1077;&#1090;&#1089;&#1103; &#1074; &#1085;&#1086;&#1095;&#1100; &#1089; 4 &#1085;&#1072; 5 &#1084;&#1072;&#1088;&#1090;&#1072; &#1074; 2:30 &#1087;&#1086; &#1052;&#1086;&#1089;&#1082;&#1074;&#1077;. &#1069;&#1092;&#1080;&#1088; &#1073;&#1091;&#1076;&#1077;&#1090; &#1076;&#1086;&#1089;&#1090;&#1091;&#1087;&#1077;&#1085; &#1085;&#1072; &#1089;&#1087;&#1077;&#1094;&#1087;&#1088;&#1086;&#1077;&#1082;&#1090;&#1077; &#1050;&#1080;&#1085;&#1086;&#1055;&#1086;&#1080;&#1089;&#1082;&#1072; &#1080; &#1085;&#1072; &#1075;&#1083;&#1072;&#1074;&#1085;&#1086;&#1081; &#1071;&#1085;&#1076;&#1077;&#1082;&#1089;&#1072;.','05-March-2018','1520189409500_oscar.jpg');

/*Table structure for table `blog_comment` */

DROP TABLE IF EXISTS `blog_comment`;

CREATE TABLE `blog_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `blog_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `blog_comment_ibfk_1` (`user_id`),
  KEY `blog_comment_ibfk_2` (`blog_id`),
  CONSTRAINT `blog_comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `blog_comment_ibfk_2` FOREIGN KEY (`blog_id`) REFERENCES `blog` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `blog_comment` */

/*Table structure for table `comment` */

DROP TABLE IF EXISTS `comment`;

CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `comment_ibfk_1` (`user_id`),
  KEY `comment_ibfk_2` (`movie_id`),
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `comment` */

/*Table structure for table `company` */

DROP TABLE IF EXISTS `company`;

CREATE TABLE `company` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `company` */

/*Table structure for table `director` */

DROP TABLE IF EXISTS `director`;

CREATE TABLE `director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `nationality` varchar(255) NOT NULL,
  `age` int(11) NOT NULL,
  `picture` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;

/*Data for the table `director` */

insert  into `director`(`id`,`name`,`surname`,`nationality`,`age`,`picture`) values (1,'Artash','Haroyan','Armenian',23,''),(2,'Robert','Zemeckis','USA',65,'directorRob.jpg'),(4,'Christhopher','Nolan','UK',48,'ChrisNolan.jpg'),(5,'David','Fincher','USA',55,'David_Fincher_(2012)_4.jpg'),(6,'Patrick','Hughes','Australia',30,'directorPat.jpg'),(7,'Jon ','Turteltaub','USA',55,'JohnTurtel.jpg'),(8,'Quentin','Tarantino','USA',55,'Quentin.jpg');

/*Table structure for table `director_movie` */

DROP TABLE IF EXISTS `director_movie`;

CREATE TABLE `director_movie` (
  `director_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`director_id`,`movie_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `director_movie_ibfk_1` FOREIGN KEY (`director_id`) REFERENCES `director` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `director_movie_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `director_movie` */

insert  into `director_movie`(`director_id`,`movie_id`) values (2,8),(4,9),(2,10),(5,11),(6,12),(7,13),(7,14),(5,16);

/*Table structure for table `genre` */

DROP TABLE IF EXISTS `genre`;

CREATE TABLE `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

/*Data for the table `genre` */

insert  into `genre`(`id`,`name`) values (1,'Action'),(3,'Drama'),(4,'Fantasy'),(5,'Sport'),(6,'Melodrama'),(7,'Adventure'),(8,'Crime'),(9,'Comedy');

/*Table structure for table `movie` */

DROP TABLE IF EXISTS `movie`;

CREATE TABLE `movie` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `year` varchar(255) NOT NULL,
  `country` varchar(255) NOT NULL,
  `movie_time` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `movie_trailer` varchar(255) NOT NULL,
  `imdb_rate` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=latin1;

/*Data for the table `movie` */

insert  into `movie`(`id`,`title`,`description`,`year`,`country`,`movie_time`,`picture`,`movie_trailer`,`imdb_rate`) values (8,'The Shawshank Redemption','The Shawshank Redemption is a 1994 American drama film written and directed by Frank Darabont, based on the 1982 Stephen King novella Rita Hayworth and Shawshank Redemption. It tells the story of banker Andy Dufresne (Tim Robbins), who is sentenced to life in Shawshank State Penitentiary for the murder of his wife and her lover, despite his claims of innocence. Over the following two decades, he befriends a fellow prisoner, contraband smuggler Ellis \"Red\" Redding (Morgan Freeman), and becomes instrumental in a money laundering operation led by the prison warden Samuel Norton (Bob Gunton). William Sadler, Clancy Brown, Gil Bellows, and James Whitmore appear in supporting roles.  Darabont purchased the film rights to King\'s story in 1987, but development did not begin until five years later when he wrote the script over an eight-week period. Two weeks after submitting his script to the Castle Rock Entertainment film studio, Darabont secured a $25 million budget to produce The Shawshank Redemption, which started pre-production in January 1993. While the film is set in Maine, principal photography took place almost entirely in Mansfield, Ohio, with the Ohio State Reformatory serving as the eponymous penitentiary. The project attracted many notable stars of the time for the lead roles including Tom Hanks, Tom Cruise, and Kevin Costner. Thomas Newman provided the film\'s score.','1994','USA','2h 22min','1521203902044_shawshenk.jpg','https://www.youtube.com/watch?v=6hB3S9bIaco','9.0'),(9,'Inception','Inception is a 2010 science fiction film written, co-produced, and directed by Christopher Nolan, and co-produced by Emma Thomas. The film stars Leonardo DiCaprio as a professional thief who steals information by infiltrating the subconscious, and is offered a chance to have his criminal history erased as payment for the implantation of another person\'s idea into a target\'s subconscious.[4] The ensemble cast additionally includes Ken Watanabe, Joseph Gordon-Levitt, Marion Cotillard, Ellen Page, Tom Hardy, Dileep Rao, Cillian Murphy, Tom Berenger, and Michael Caine.  After the 2002 completion of Insomnia, Nolan presented to Warner Bros. a written 80-page treatment about a horror film envisioning \"dream stealers\" based on lucid dreaming.[5] Deciding he needed more experience before tackling a production of this magnitude and complexity, Nolan retired the project and instead worked on 2005\'s Batman Begins, 2006\'s The Prestige, and The Dark Knight in 2008.[6] The treatment was revised over 6 months and was purchased by Warner in February 2009.[7] Inception was filmed in six countries, beginning in Tokyo on June 19 and ending in Canada on November 22.[8] Its official budget was $160 million, split between Warner Bros and Legendary.[9] Nolan\'s reputation and success with The Dark Knight helped secure the film\'s $100 million in advertising expenditure.','2010','Russia','2h 28min','1521204337934_Incep.jpg','https://www.youtube.com/watch?v=YoHD9XEInc0','7.8'),(10,'Oblivion','Oblivion is a 2013 American post-apocalyptic science fiction film based on Joseph Kosinski\'s unpublished Radical Publishing graphic novel of the same name. The film was co-produced and directed by Kosinski.[6][7][8] It stars Tom Cruise, Morgan Freeman, Andrea Riseborough, and Olga Kurylenko.[9][10] The film was released in the U.S. on April 19, 2013.[11] According to Kosinski, Oblivion pays homage to science fiction films of the 1970s.[12]  Oblivion received mixed reviews. Cruise\'s performance and the visual effects were praised, while reception of the plot was mixed. Reviewers criticized the film\'s incorporation of elements from other sci-fi films and what Rotten Tomatoes called a \"thinly scripted\" story. However, it was a modest commercial success, grossing $286 million worldwide against a $160 million budget.','2013','USA','2h 4min','1521204624826_oblivion.jpg','https://www.youtube.com/watch?v=XmIIgE7eSak','8.9'),(11,'Seven','Seven (stylized as SE7EN) is a 1995 American neo-noir crime thriller film directed by David Fincher and written by Andrew Kevin Walker. It stars Brad Pitt, Morgan Freeman, Gwyneth Paltrow, John C. McGinley, R. Lee Ermey, and Kevin Spacey. It tells the story of David Mills (Pitt), a detective who partners with the retiring William Somerset (Freeman) to track down a serial killer (Spacey) who uses the seven deadly sins as a motif in his murders.  The screenplay was influenced by the time Walker spent in New York City trying to make it as a writer. Principal photography took place in Los Angeles, with the last scene filmed near Lancaster, California. The film\'s budget was US$33 million.  Released on September 22, 1995 by New Line Cinema, Seven was the seventh-highest-grossing film of the year, grossing over $327 million worldwide.[2] It was well received by critics, who praised the film\'s darkness, brutality and themes. The film was nominated for Best Film Editing at the 68th Academy Awards, but lost to Apollo 13.','1995','USA','2h 7min','1521204981310_Seven.jpg','https://www.youtube.com/watch?v=znmZoVkCjpI','8.7'),(12,'The Expendables 3','The Expendables 3 is a 2014 American ensemble action film directed by Patrick Hughes and written by Creighton Rothenberger, Katrin Benedikt and Sylvester Stallone. It is the third installment in The Expendables film series and the sequel to The Expendables (2010) and The Expendables 2 (2012). The film\'s cast includes Sylvester Stallone, Jason Statham, Antonio Banderas, Jet Li, Wesley Snipes, Dolph Lundgren, Kelsey Grammer, Randy Couture, Terry Crews, Kellan Lutz, Ronda Rousey, Glen Powell, Victor Ortiz, Mel Gibson, Harrison Ford and Arnold Schwarzenegger. The story follows the mercenary group known as \"The Expendables\" as they come into conflict with ruthless arms dealer Conrad Stonebanks, the Expendables\' co-founder, who is determined to destroy the team. The film premiered in London on August 4, 2014[5] and was released theatrically on August 15, 2014 by Lionsgate. Unlike the first two films in the franchise, The Expendables 3 is the only film in the series to receive a PG-13 rating instead of an R rating, which upset many fans of the franchise.[6] With a running time of two hours and six minutes, it is the longest film of the franchise. The film grossed $214 million worldwide on a $90 million budget.','2014','UK','2h 6min','1521205339160_Expantable.jpg','https://www.youtube.com/watch?v=4xD0junWlFc','9.3'),(13,'Last Vegas','Billy, Paddy, Archie and Sam are childhood friends from Flatbush, Brooklyn, New York, who are now living in their senior years. Sam and his wife Miriam are living mundane lives in Naples, Florida. Archie, twice-divorced and recovering from a minor stroke, lives with his overprotective son Ezra and his family in Englewood, New Jersey. Paddy lives alone in his Brooklyn apartment, a curmudgeon in grief since the death of his wife, Sophie, over a year ago. Billy is a successful entrepreneur in Malibu, California, who lives with his 31-year-old girlfriend Lisa. Shortly after proposing to Lisa, Billy finds an old bottle of scotch he and his friends stole in their childhood days and calls Sam and Archie, who immediately propose a bachelor party for Billy in Las Vegas before his wedding that weekend. After being given permission by Miriam to cheat on her, Sam collects Archie and Paddy and fly off to rendezvous with Billy in Vegas.  Arriving in Vegas, Billy and Paddy get into a heated argument about Billy\'s failure to attend Sophie\'s funeral. They head to Binion\'s Gambling Hall and Hotel to check in, only to realize that the hotel is closed for renovations. They agree to try the Aria Resort and Casino, where the wedding will be held. Before leaving Binion\'s they are attracted to the lounge by the singing voice of Diana, who is immediately charmed by their appreciation of her singing. The five share a drink, and they convince Diana to join them at The Aria.','2013','USA','1h 45min','1521205584803_Starperci.jpg','https://www.youtube.com/watch?v=TvK3m0wJutI','6.8'),(14,'National Treasure','National Treasure is a 2004 American adventure heist film produced and released by Walt Disney Pictures. It was written by Jim Kouf and the Wibberleys, produced by Jerry Bruckheimer and directed by Jon Turteltaub. It is the first film in the National Treasure film series and stars Nicolas Cage, Harvey Keitel, Jon Voight, Diane Kruger, Sean Bean, Justin Bartha and Christopher Plummer.  Cage plays Benjamin Franklin Gates, a historian and amateur cryptologist searching for a lost treasure of precious metals, jewelry, artwork and other artifacts that was accumulated into a single massive stockpile by looters and warriors over many millennia starting in Ancient Egypt, later rediscovered by warriors who form themselves into the Knights Templar to protect the treasure, eventually hidden by American Freemasons during the American Revolutionary War. A coded map on the back of the Declaration of Independence points to the location of the \"national treasure,\" but Gates is not alone in his quest. Whoever can steal the Declaration and decode it first will find the greatest treasure in history.  National Treasure was released worldwide on November 19, 2004. The film received mixed reviews from critics, but was a box office success, grossing over $347 million worldwide.','2004','Russia','2h 11min','1521205751221_Threasuer.jpg','https://www.youtube.com/watch?v=mcf4tXYjaxo','8.6'),(16,'Black Panter','Black Panther is a 2018 American superhero film based on the Marvel Comics character of the same name. Produced by Marvel Studios and distributed by Walt Disney Studios Motion Pictures, it is the eighteenth film in the Marvel Cinematic Universe (MCU). The film is directed by Ryan Coogler, who co-wrote the screenplay with Joe Robert Cole, and stars Chadwick Boseman as T\'Challa / Black Panther, alongside Michael B. Jordan, Lupita Nyong\'o, Danai Gurira, Martin Freeman, Daniel Kaluuya, Letitia Wright, Winston Duke, Angela Bassett, Forest Whitaker, and Andy Serkis. In Black Panther, T\'Challa returns home as king of Wakanda but finds his sovereignty challenged by a new adversary, in a conflict with global consequences.','2018','USA','2h 14min','1521226745330_BlackPanter.jpg','https://www.youtube.com/watch?v=xjDjIWPwcPU','9.5');

/*Table structure for table `movie_genre` */

DROP TABLE IF EXISTS `movie_genre`;

CREATE TABLE `movie_genre` (
  `movie_id` int(11) NOT NULL,
  `genre_id` int(11) NOT NULL,
  PRIMARY KEY (`movie_id`,`genre_id`),
  KEY `movie_genre_ibfk_2` (`genre_id`),
  CONSTRAINT `movie_genre_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `movie_genre_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `movie_genre` */

insert  into `movie_genre`(`movie_id`,`genre_id`) values (9,1),(10,1),(12,1),(14,1),(16,1),(8,3),(11,3),(9,7),(10,7),(12,7),(14,7),(16,7),(8,8),(11,8),(13,9);

/*Table structure for table `user` */

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `surname` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_type` enum('USER','ADMIN') NOT NULL,
  `pic_url` varchar(255) DEFAULT NULL,
  `answer_count` int(11) NOT NULL,
  `verify` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;

/*Data for the table `user` */

insert  into `user`(`id`,`name`,`surname`,`email`,`password`,`created_date`,`user_type`,`pic_url`,`answer_count`,`verify`) values (16,'Karen','Hovhannisyan','b@gmail.com','$2a$10$Wwwx9/z3cGXFfzmbthKONOah6.nC2mLk6./QMc.nyhAhurHlopOBG','2018-04-27 16:35:07','ADMIN','1520453862439_oscar.jpg',0,1),(21,'Karen','Hovhannisyan','a@mail.ru','$2a$10$jCg3HznynPS6oR5cXob0S.WblyWAsi1EdjzJ2KtwxYPDS7Uv9wcTK','2018-04-21 23:17:57','USER','1524322266834_29512502_783275131872231_2018293097615589376_n.jpg',9,1),(22,'Karen','Hopkins','karen.chess1997@gmail.com','$2a$10$DuiYoJrZY6MTuETVcv5mueJxQWzZdHKX/0O5F9dBSiL2.9UVyjuja','2018-04-27 17:13:22','ADMIN','1524836147395_',0,1);

/*Table structure for table `wish` */

DROP TABLE IF EXISTS `wish`;

CREATE TABLE `wish` (
  `user_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  PRIMARY KEY (`user_id`,`movie_id`),
  KEY `movie_id` (`movie_id`),
  CONSTRAINT `wish_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  CONSTRAINT `wish_ibfk_2` FOREIGN KEY (`movie_id`) REFERENCES `movie` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

/*Data for the table `wish` */

insert  into `wish`(`user_id`,`movie_id`) values (21,8),(21,9),(21,10),(21,11),(21,14);

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
