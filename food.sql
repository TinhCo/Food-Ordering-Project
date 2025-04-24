-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 24, 2025 at 01:33 PM
-- Server version: 10.4.28-MariaDB
-- PHP Version: 8.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food`
--

-- --------------------------------------------------------

--
-- Table structure for table `about`
--

CREATE TABLE `about` (
  `id` bigint(20) NOT NULL,
  `content` mediumtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `posted_at` datetime(6) DEFAULT NULL,
  `slug` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `about`
--

INSERT INTO `about` (`id`, `content`, `image`, `name`, `posted_at`, `slug`) VALUES
(5, '<div class=\"col-lg-9\">\n<p class=\"fw-700 fs-17-mb lh-25-mb\">Đồ ăn nhanh như gà rán, kimbap, bánh mì,... đang được rất nhiều bạn trẻ yêu thích bởi sự tiện dụng, nhìn bắt mắt và hương vị cực hấp dẫn. Vậy đồ ăn nhanh là gì? Top món ăn nhanh có lợi cho sức khỏe được nhiều người ưa chuộng? Hãy cùng Vincom tìm hiểu trong bài viết này nhé!</p>\n<p class=\"event-date-black fw-700 mb-30 mb-20-lt mb-14-mb fs-14-mb-tl\">\n<span class=\"text-muted fs-14-mb lh-20-mb fw-400 \">Ngày đăng:</span>\n14.04.2022\n</p>\n<div class=\"text-break fs-entry-content\">\n<h2><strong><span style=\"text-align:justify;display :block\">Thức ăn nhanh là gì? Nguồn gốc của thức ăn nhanh</span></strong></h2><h3><strong><span style=\"text-align:justify;display :block\">Thức ăn nhanh là gì?</span></strong></h3><p><strong>Đồ ăn nhanh</strong> có tên gọi tiếng anh là Fastfood. Đây là những món ăn, thực phẩm hay đồ uống được chế biến nhanh chóng và thưởng thức tại chỗ hoặc gói mang về. Thông thường, <strong>đồ ăn nhanh</strong> được chế biến sẵn, khi khách tới mua thì nhà hàng chỉ cần làm nóng hoặc chiên lại trong vài phút là đã có thể phục vụ thực khách.</p><p><strong>Đồ ăn nhanh</strong> được bày bán ở những quán ăn, lề đường, cửa hàng tiện lợi,... Vì đồ ăn đã được làm chín sẵn nên trông rất ngon, hấp dẫn và đẹp mắt. Fastfood đang trở thành xu hướng tiêu dùng cho những ai có phong cách sống bận rộn.</p><p><img alt=\"Đồ ăn nhanh đang trở nên phổ biến trên toàn thế giới\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/do-an-nhanh-cho-nguoi-ban-ron.jpg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Nguồn gốc của thức ăn nhanh</span></strong></h3><p><strong>Đồ ăn nhanh</strong> được gắn liền với sự phát triển của những đô thị lớn, khi con người ngày càng trở nên bận rộn với cuộc sống, cũng như ưa chuộng các loại thức ăn giúp tiết kiệm thời gian chế biến và chi phí hơn. Cụ thể, các ngôi nhà ở những thành phố lớn thường thiếu không gian nấu nướng hoặc không đủ dụng cụ để chế biến thực phẩm. Thậm chí, việc mua nguyên liệu nấu ăn cũng có thể tiêu nhiều tiền hơn các sản phẩm đã được chế biến sẵn.</p><p>Chính vì thế, người dân thành thị được khuyến khích mua các loại thực phẩm được chế biến sẵn ở bên ngoài. Nhất là trong thời kỳ bùng nổ kinh tế Mỹ, sau Thế chiến thứ 2, người dân ở đây bắt đầu chi tiêu và mua sắm nhiều hơn. Tùy vào văn hóa mỗi vùng đất nước mà <strong>đồ ăn nhanh</strong> cũng có nhiều loại như bánh mì, hamburger, pizza, bánh mì sandwich, khoai tây nghiền,...</p><h2><strong><span style=\"text-align:justify;display :block\">Tác hại của đồ ăn nhanh</span></strong></h2><p>Tuy <strong>đồ ăn nhanh</strong> ngon và tiện lợi nhưng nếu lạm dụng hay lựa chọn không đúng sẽ gây nên một số vấn đề không tốt cho sức khỏe người dùng, cụ thể:</p><ul><li><p><span style=\"text-align:justify;display :block\">Có thể gây ra tình trạng thừa cân, béo phì.</span></p></li><li><p><span style=\"text-align:justify;display :block\">Làm tăng khả năng mắc bệnh tim mạch, hô hấp, xương khớp và thần kinh.</span></p></li><li><p><span style=\"text-align:justify;display :block\">Ảnh hưởng xấu đến răng, làn da và hệ tiêu hóa.</span></p></li></ul><h2><strong><span style=\"text-align:justify;display :block\">TOP các món đồ ăn sáng nhanh tốt cho sức khỏe</span></strong></h2><h3><strong><span style=\"text-align:justify;display :block\">Cháo yến mạch</span></strong></h3><p><span style=\"text-align:justify;display :block\">Yến mạch là một trong những loại ngũ cốc tốt cho sức khỏe con người và cũng nằm trong danh sách thức ăn chế biến nhanh. Bạn chỉ cần một gói bột yến mạch không chứa đường và vài thìa quả óc chó thái mỏng là có ngay bữa sáng đầy đủ chất dinh dưỡng. Các loại hạt là nguồn cung cấp chất béo không bão hòa đơn rất tốt cho tim mạch.</span></p><p><img alt=\"Cháo yến mạch bổ dưỡng\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/chao-yen-mach.jpg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Salad rau trộn</span></strong></h3><p>Salad rau trộn là một món <strong>đồ ăn nhanh</strong> ngon được nhiều người ưa chuộng, bởi sử dụng nhiều loại rau xanh cùng nước sốt có vị chua ngọt để kích thích vị giác ngon hơn trong bữa ăn. Bạn có thể dùng cải xoăn, rong nhỏ, rau bina,... vì chứa nhiều vitamin, chất xơ, các chất chống oxy hóa có lợi cho hệ tiêu hóa, phòng ngừa bệnh ung thư và tim mạch.</p><p><img alt=\"Salad rau trộn với nhiều nguyên liệu tốt cho sức khỏe\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/salad-rau-tron.jpg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Bánh mì trái cây</span></strong></h3><p><span style=\"text-align:justify;display :block\">Mỗi loại trái cây đều có giá trị dinh dưỡng khác nhau, cung cấp nhiều khoáng chất, vitamin và chất chống oxy hóa cho cơ thể. Do đó, bạn có thể sử dụng bánh mì có thành phần trái cây như táo, dưa gang, nho hoặc cam để thưởng thức. Bên cạnh đó, hàm lượng carbs trong bánh mì còn có khả năng chống đói và cung cấp năng lượng cho cơ thể hoạt động rất hiệu quả.</span></p><p><img alt=\"Bánh mì trái cây có tác dụng cung cấp năng lượng rất hiệu quả\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/banh-mi-trai-cay.jpg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Bánh kẹp thịt</span></strong></h3><p>Bánh kẹp thịt là <strong>đồ ăn nhanh</strong> ngon tiết kiệm thời gian chuẩn bị và tiết kiệm chi phí cá nhân mỗi ngày. Bạn có thể dùng bánh mì kẹp thịt, chả hay bánh mì Hy Lạp cuộn thịt gà để thưởng thức. Lớp bánh mì nóng giòn kết hợp với thịt dai mềm vừa ăn cùng nước sốt đậm đà dùng làm món điểm tâm sáng rất tuyệt vời.</p><p><img alt=\"Bánh kẹp thịt ngon miệng, hấp dẫn\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/banh-mi-kep-thit.jpg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Bánh hạt hoa quả</span></strong></h3><p><span style=\"text-align:justify;display :block\">Bánh sử dụng các loại hạt hoa quả cũng là thức ăn nhanh giúp bạn giảm bớt những cơn đói buổi sáng, trong lúc làm việc hay học hành. Bạn có thể ăn bánh biscotti hạt chia giòn rụm với hương thơm của tắc rất có lợi cho tiêu hóa hay bánh hạt sen chiên giòn, vị bùi ngọt vừa ăn mà lại giúp bạn ngủ ngon.</span></p><p><img alt=\"Bánh hạt hoa quả chứa nhiều dưỡng chất\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/banh-hat-hoa-qua.jpg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Sữa chua</span></strong></h3><p>Sữa chua là một trong những loại <strong>đồ ăn nhanh</strong> có nhiều công dụng cho sức khỏe, từ việc có lợi cho tiêu hóa đến làm đẹp cho da. Sữa chua nhìn mềm mịn cùng vị chua đặc trưng, có thể dùng trực tiếp hoặc kết hợp với nhiều loại trái cây, rau củ để tăng thêm chất dinh dưỡng.</p><p><img alt=\"Sữa chua tốt cho hệ tiêu hóa của con người\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/sua-chua.png\"></p><h3><strong><span style=\"text-align:justify;display :block\">Hoa, quả, hạt khô</span></strong></h3><p><span style=\"text-align:justify;display :block\">Các loại hoa, quả, hạt khô được rang hoặc sấy tự nhiên, thậm chí được kết hợp với một số loại gia vị như đường, muối, tỏi, ớt đều trở thành món ăn sáng nhanh tốt cho sức khoẻ, hấp dẫn mọi lứa tuổi. Bạn có thể dùng vải sấy, hạt điều rang tỏi ớt, mít sấy,... để nhâm nhi trong lúc học tập hay làm việc rất thú vị.</span></p><p><img alt=\"Hoa quả, hạt khô chứa nhiều vitamin\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/hoa-qua-hat-kho.jpg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Sữa hạt</span></strong></h3><p><span style=\"text-align:justify;display :block\">Sữa hạt không chỉ cung cấp dưỡng chất cho cơ thể mà còn được nhiều người sử dụng để thay thế cho bữa ăn sáng. Các loại hạt được dùng để nấu sữa phổ biến như hạt sen, đậu nành, mè đen, hạt điều, hạt óc chó,... đều rất ngon miệng và kèm với nhiều lợi ích khác cho sức khỏe của chúng ta.</span></p><p><img alt=\"Sữa hạt có thành phần dinh dưỡng cực cao\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/sua-hat.jpg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Trứng luộc với rau</span></strong></h3><p><span style=\"text-align:justify;display :block\">Trứng là một nguồn dinh dưỡng giàu protein, vitamin và các khoáng chất quan trọng. Nhờ hàm lượng protein cao, trứng có thể giảm thèm ăn, giúp giảm cân hiệu quả. Bạn chỉ cần một quả trứng luộc với một vài lát dưa leo, rau xanh hay cà chua bi là đủ.</span></p><p><img alt=\"Trứng luộc với rau có tác dụng giảm cân hiệu quả\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/trung-luoc-voi-rau.jpg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Bánh mỳ bơ lạc</span></strong></h3><p><span style=\"text-align:justify;display :block\">Bánh mỳ bơ lạc là đồ ăn nhanh dễ làm, cân bằng mà không cần phải bảo quản trong tủ lạnh. Bạn chỉ cần một lát bánh mì và một thìa bơ lạc là đủ. Để tăng cường sức khỏe, bạn nên sử dụng bánh mỳ được làm từ ngũ cốc nguyên hạt và bơ lạc tự nhiên không chất bảo quản.</span></p><p><img alt=\"Bánh mì bơ lạc vừa béo vừa ngon\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/banh-mi-bo-lac.jpg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Sữa chua Hy Lạp với hoa quả</span></strong></h3><p><span style=\"text-align:justify;display :block\">Sữa chua Hy Lạp là một lựa chọn bổ sung giàu dưỡng chất phù hợp với các loại thực phẩm như bơ hạt đậu, quả mọng hoặc trứng. Ngoài ra, sữa chua Hy Lạp còn có rất nhiều lợi ích cho sức khỏe như giữ hệ thống tiêu hóa hoạt động tốt, giúp bạn cảm thấy phấn chấn,...</span></p><p><img alt=\"Sữa chua kết hợp với các loại quả mọng cực kỳ ngon miệng\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/sua-chua-hoa-qua.jpg\"></p><h2><strong><span style=\"text-align:justify;display :block\">TOP 10 đồ ăn nhanh phổ biến trên thế giới</span></strong></h2><h3><strong><span style=\"text-align:justify;display :block\">Bánh mì</span></strong></h3><p><span style=\"text-align:justify;display :block\">Bánh mì là đồ ăn nhanh truyền thống của người Việt. Món ăn này được dùng làm đồ ăn sáng hoặc xế chiều. Bánh mì có lớp vỏ ngoài xốp giòn, bên trong là phần nhân đầy đặn xá xíu, rau thơm, nộm, pate, thịt, dưa leo và thêm một ít nước sốt, tương ớt.</span></p><p><img alt=\"Bánh mì là loại thức ăn nhanh phổ biến ở một số nước, trong đó có việt nam\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/banh-mi.jpg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Gà rán</span></strong></h3><p><span style=\"text-align:justify;display :block\">Gà rán là một trong các loại đồ ăn nhanh ngon được ưa chuộng trên toàn thế giới. Những miếng đùi gà, ức gà hay cánh gà được tẩm ướp gia vị và áo qua một lớp bột chiên xù rồi chiên ngập trong dầu. Bạn có thể lựa chọn món gà rán truyền thống hoặc chọn hà lắc phô mai, gà sốt cay,...</span></p><p><img alt=\"Gà rán giòn tan là món khoái khẩu của nhiều người\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/ga-ran.jpg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Hamburger</span></strong></h3><p><span style=\"text-align:justify;display :block\">Hamburger là một thức ăn nhanh phổ biến ở Mỹ và một số quốc gia phương Tây. Món ăn này gồm có bánh mì tròn kẹp một lát thịt bò xay ở giữa, kèm cà chua, rau xà lách, phô mai và một ít nước sốt.</span></p><p><img alt=\"Hamburger là món ăn nhanh phổ biến ở phương Tây\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/hamburger.jpg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Pizza</span></strong></h3><p><span style=\"text-align:justify;display :block\">Pizza là món đồ ăn nhanh ngon có nguồn gốc xuất xứ từ Ý. Bánh có đế là bánh mì được nướng trên đá nóng rồi rắc thêm phô mai, sốt cà chua và nhiều loại nhân khác nhau như hải sản, bò, xúc xích, nấm,... cực hấp dẫn và bắt mắt.</span></p><p><img alt=\"Pizza hấp dẫn cũng là một món ăn nhanh nổi tiếng\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/pizza.jpg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Khoai tây chiên</span></strong></h3><p><span style=\"text-align:justify;display :block\">Khoai tây chiên là đồ ăn nhanh phổ biến ở nhiều quốc gia từ thành thị cho đến nông thôn. Mỗi củ khoai tây sẽ được biến tấu thành đủ món và các món đều có hương vị riêng không giống nhau. Hiện nay, có ít nhất 15 loại khoai tây chiên như khoai tây xoắn, khoai tây cắt lát mỏng, khoai tây cắt dọc truyền thống, khoai tây kiểu Bỉ,...</span></p><p><img alt=\"Khoai tây chiên giòn ngon là món khoái khẩu của nhiều bạn trẻ\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/khoai-tay-chien.jpg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Donut</span></strong></h3><p><span style=\"text-align:justify;display :block\">Donut là loại bánh ngọt nướng hoặc rán dùng làm đồ ăn nhanh hoặc tráng miệng. Loại bánh này rất nổi tiếng ở nhiều nước phương Tây, bạn có thể mua trong cửa hàng hoặc tự làm tại nhà. Donut thường có dạng hình vòng nhưng cũng có hình tròn nhỏ nhồi nhân bên trong.</span></p><p>&gt;&gt; Xem thêm: <a href=\"https://vincom.com.vn/trend/buffet-do-ngot\">CHECK-IN NGAY 13+ ĐỊA CHỈ BUFFET ĐỒ NGỌT LÀM DÂN TÌNH MÊ MỆT TẠI TPHCM</a></p><p><img alt=\"Donut là món ngọt yêu thích của đa số người\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/donut-ngon.jpg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Pasta</span></strong></h3><p><span style=\"text-align:justify;display :block\">Pasta là một loại thức ăn nhanh phổ biến trên khắp thế giới có xuất xứ từ nước Ý. Pasta có hơn 310 loại với 1300 tên gọi. Bánh có hương vị và hình dáng khác nhau, từ hình ống, cọng dài cho đến xoắn ốc, hình bướm, vỏ sò, nơ,...</span></p><p><img alt=\"Pasta có nguồn gốc xuất xứ từ Ý\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/pasta.jpg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Xúc xích</span></strong></h3><p><span style=\"text-align:justify;display :block\">Xúc xích là một trong những loại đồ ăn nhanh phổ biến được chế biến từ các loại thịt như heo, bò hay gà. Với thành phần chính là thịt xay nhuyễn kết hợp cùng bột, phụ gia và các loại gia vị. Bên cạnh đó, vỏ xúc xích được làm bằng Collagen vì mỏng, có độ dai và giòn. Bạn có thể đem xúc xích đi chiên, nướng hoặc hấp đều thơm ngon.</span></p><p><img alt=\"Xúc xích ngon, vỏ dai giòn, nhân mềm mại\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/xuc-xich.jpg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Kimbap</span></strong></h3><p><span style=\"text-align:justify;display :block\">Kimbap là món ăn nhanh khá phổ biến đến từ Hàn Quốc được các bạn trẻ đặc biệt yêu thích. Đây là món ăn rất đơn giản, được chế biến từ cơm cùng phần nhân được gói trong lá rong biển. Khi ăn bạn chỉ cần cắt từng miếng nhỏ vừa ăn và chấm với nước sốt Mayonnaise.</span></p><p><img alt=\"Kimbap là món ăn cực kỳ tiện lợi và ngon miệng\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/kimbap.jpeg\"></p><h3><strong><span style=\"text-align:justify;display :block\">Snack</span></strong></h3><p><span style=\"text-align:justify;display :block\">Snack hay còn gọi là bim bim, một trong những loại đồ ăn vặt thường được làm từ khoai tây hay các loại bột được tẩm ướp gia vị. Snack được đóng túi ăn liền nên có thể giúp bạn chống đói nhanh chóng hoặc ăn kèm khi tán gẫu cùng bạn bè.</span></p><p><img alt=\"Snack là món ăn vặt khoái khẩu của nhiều người\" src=\"https://statics.vincom.com.vn/xu-huong/chi_tiet_xu_huong/1/14-4/3/snack.jpg\"></p><p><span style=\"text-align:justify;display :block\">Qua bài viết này, chắc hẳn bạn đã biết đồ ăn nhanh là gì? Và những món ăn nhanh có lợi cho sức khỏe. Hy vọng, với những chia sẻ của Vincom bạn có thể lựa chọn cho mình những món ăn hợp với khẩu vị cũng như tốt cho sức khỏe của bản thân.</span></p>\n</div>\n</div>', 'billgates.png', 'Đồ ăn nhanh là gì? TOP món ăn nhanh có lợi cho sức khỏe', '2024-08-31 10:11:05.000000', 'gioi-thieu'),
(6, '<div class=\"p-6 bg-white rounded-lg shadow-md\">\n    <!-- Title Section -->\n    <div class=\"mb-6 text-center\">\n        <h1 class=\"text-2xl font-bold text-gray-800\">CHÍNH SÁCH GIAO – NHẬN HÀNG</h1>\n    </div>\n\n    <!-- Image Section -->\n    <div class=\"mb-6\">\n        <figure>\n            <img class=\"w-full h-auto rounded-md shadow-md\" src=\"https://cdnbiz.abphotos.link/photos/resized/1000x/2023/03/17/1679037099_8woMudWfB7GNji1O_1679046234-phphyimar.png\" alt=\"news-image\">\n        </figure>\n    </div>\n\n    <!-- Content Section -->\n    <div class=\"space-y-6 text-gray-700\">\n        <!-- Section 1 -->\n        <div>\n            <h2 class=\"text-xl font-semibold\">1. Phạm vi áp dụng:</h2>\n            <p>Nội thành Hà Nội</p>\n        </div>\n\n        <!-- Section 2 -->\n        <div>\n            <h2 class=\"text-xl font-semibold\">2. Thời gian giao - nhận hàng:</h2>\n            <p>- Trong vòng 10 phút sau khi quý khách đặt đơn, FoodHub sẽ gọi điện xác nhận đơn hàng và tư vấn sản phẩm và chốt đơn.</p>\n            <p>- FoodHub bắt đầu đóng hàng trong vòng 30 phút kể từ khi xác nhận đơn.</p>\n            <p>- Sau 1 giờ đồng hồ sản phẩm đã sẵn sàng giao đến khách hàng.</p>\n            <p>- Trong trường hợp quý khách có yêu cầu sơ chế như nhặt rau, thái thịt,... thời gian sẵn sàng giao hàng có thể sẽ lâu hơn nhưng không quá 2 giờ đồng hồ.</p>\n            <p>- FoodHub chỉ cung cấp dịch vụ với các khách hàng tại khu vực nội thành Hà Nội.</p>\n        </div>\n\n        <!-- Section 3 -->\n        <div>\n            <h2 class=\"text-xl font-semibold\">3. Chính sách khách hàng:</h2>\n            <p>Từ ngày 5/5/2021, FoodHub ra mắt nhiều chương trình ưu đãi dành cho Quý khách hàng đã tin dùng và ủng hộ FoodHub với mong muốn khách hàng sẽ có được trải nghiệm mua sắm tốt nhất khi đồng hành cùng chúng tôi:</p>\n            \n            <!-- Subsection 1: Voucher -->\n            <h3 class=\"text-lg font-semibold text-teal-600\">Ưu đãi Voucher (dành cho khách hàng tải App lần đầu)</h3>\n            <ul class=\"list-disc list-inside pl-4\">\n                <li>Với đơn hàng trên 300K khách hàng được giảm 50k.</li>\n                <li>Với đơn hàng trên 200K khách hàng được giảm 30k.</li>\n            </ul>\n            \n            <!-- Subsection 2: Shipping Fee -->\n            <h3 class=\"text-lg font-semibold text-teal-600\">Ưu đãi phí ship</h3>\n            <ul class=\"list-disc list-inside pl-4\">\n                <li>Đơn hàng từ 1 triệu trở lên khách hàng được hỗ trợ 50K phí ship.</li>\n                <li>Đơn hàng từ 800K trở lên khách hàng được hỗ trợ 30K phí ship.</li>\n                <li>Đơn hàng từ 500K đến 800K khách hàng được hỗ trợ 20K phí ship.</li>\n                <li>Đơn hàng từ 200K – 500K khách hàng được hỗ trợ 10K phí ship.</li>\n            </ul>\n            \n            <!-- Subsection 3: Points System -->\n            <h3 class=\"text-lg font-semibold text-teal-600\">Chính sách tích điểm và đổi điểm</h3>\n            <ul class=\"list-disc list-inside pl-4\">\n                <li>Khách hàng sẽ nhận được 1 điểm có giá trị tương đương 1000đ khi thanh toán.</li>\n                <li>2200 điểm khách hàng sẽ đổi được 50.000 VNĐ.</li>\n                <li>1500 điểm khách hàng sẽ đổi được 30.000 VNĐ.</li>\n                <li>1000 điểm khách hàng sẽ đổi được 10.000 VNĐ.</li>\n            </ul>\n        </div>\n\n        <!-- Warranty Section -->\n        <div>\n            <h3 class=\"text-lg font-semibold text-teal-600\">Chính sách bảo hành</h3>\n            <p>Khi mua sản phẩm tại FoodHub, khách hàng sẽ được bảo hành trong 12 tiếng. Trong trường hợp sản phẩm bị hỏng, dập nát,… khách hàng vui lòng gọi ngay cho chúng tôi theo số hotline để được hỗ trợ.</p>\n        </div>\n\n        <!-- Contact Information -->\n        <div class=\"text-right\">\n            <p class=\"font-bold\">HOTLINE: 088.830.1518</p>\n            <p class=\"font-bold\">EMAIL: CONTACT@FOODHUB.VN</p>\n        </div>\n    </div>\n</div>\n', '1.jpg', 'Chính sách mua hàng', '2024-08-31 10:11:05.000000', 'chinh-sach-mua-hang'),
(7, '<div class=\"pageDetail-content\">\n    <div class=\"heading-pageDetail\">\n        <h1>Chính sách đổi trả</h1>\n    </div>\n    <div class=\"content-pageDetail typeList-style\">\n        <p>Chính sách Đổi trả sản phẩm của CPFoods.vn quy định các lý do chấp nhận, yêu cầu cho sản phẩm được đổi trả và thời gian xử lý đổi trả cho khách hàng.</p>\n        \n        <h2>I. Lý do chấp nhận đổi trả</h2>\n        <ul>\n            <li>Sản phẩm bị mất niêm phong, bị giao sai về số lượng, thông tin và mẫu mã so với đơn đặt hàng.</li>\n            <li>Sản phẩm bị hỏng do lỗi của nhà sản xuất hoặc lỗi trong quá trình vận chuyển.</li>\n            <li>Sản phẩm/voucher/giấy chứng nhận đã hết hạn sử dụng trước hoặc vào ngày sản phẩm được giao cho khách hàng.</li>\n            <li>Voucher/giấy chứng nhận không đúng như khách hàng đặt, lớp tráng bạc bị cào.</li>\n            <li>Nhà cung cấp bị phá sản, ngưng hoạt động dẫn đến khách hàng không sử dụng được voucher/GCN trong thời gian hiệu lực.</li>\n            <li>Voucher/GCN khi khách hàng sử dụng có chất lượng dịch vụ không đúng như cam kết.</li>\n            <li>Khách hàng thay đổi nhu cầu sử dụng.</li>\n        </ul>\n        \n        <h2>II. Điều kiện đổi trả</h2>\n        <h3>1. Yêu cầu cho sản phẩm đổi trả</h3>\n        <ul>\n            <li>Sản phẩm không nằm trong danh mục hạn chế đổi trả của CPFoods.vn.</li>\n            <li>Sản phẩm/voucher/GCN còn nguyên vẹn, đầy đủ nhãn mác, nguyên đai kiện, niêm phong theo quy cách ban đầu.</li>\n            <li>Sản phẩm/dịch vụ còn đầy đủ phụ kiện và tặng phẩm đi kèm.</li>\n            <li>Sản phẩm không bị dơ bẩn, không có mùi lạ, không có dấu hiệu đã qua sử dụng.</li>\n            <li>Khách hàng phải gửi yêu cầu đổi trả kèm tài liệu chứng minh và sản phẩm/dịch vụ cần đổi trả.</li>\n        </ul>\n        \n        <h3>2. Thời gian đổi trả</h3>\n        <p>- Trả lại hàng ngay tại thời điểm giao/nhận hàng</p>\n        <p>- Khách hàng tự mang Yêu Cầu Đổi Trả tới Trung tâm đổi trả của CPFoods.vn.</p>\n        \n        <h3>3. Chi phí đổi trả</h3>\n        <ul>\n            <li>Đối với các sản phẩm/voucher/GCN đổi lại do lỗi của CPFoods.vn hoặc nhà cung cấp, khách hàng sẽ được miễn phí đổi trả và giao hàng miễn phí.</li>\n            <li>Đối với các sản phẩm/voucher/GCN trả lại do khách hàng thay đổi nhu cầu sử dụng, khách hàng sẽ được miễn phí đổi trả và phải trả phí vận chuyển nếu muốn gửi hàng mới.</li>\n        </ul>\n        \n        <h2>III. Quy định hoàn tiền</h2>\n        <h3>1. Nguyên tắc hoàn tiền</h3>\n        <ul>\n            <li>Phương thức hoàn tiền căn cứ theo phương thức thanh toán của Khách hàng khi mua hàng.</li>\n            <li>CPFoods.vn sẽ chỉ hoàn lại khoản tiền khách hàng thực tế bỏ ra khi mua hàng.</li>\n        </ul>\n        \n        <h3>2. Phương thức hoàn tiền</h3>\n        <p>Các phương thức hoàn tiền bao gồm:</p>\n        <ul>\n            <li>Hoàn tiền vào tài khoản CPFoods.vn</li>\n            <li>Hoàn tiền thông qua hệ thống Banknet.</li>\n            <li>Hoàn tiền thông qua chuyển khoản ngân hàng.</li>\n            <li>Hoàn tiền thông qua ngân hàng chấp nhận thẻ.</li>\n            <li>Hoàn tiền mặt tại trung tâm đổi trả của CPFoods.vn.</li>\n        </ul>\n        \n        <h3>3. Thời gian xử lý</h3>\n        <ul>\n            <li>CPFoods.vn sẽ gửi kết quả phản hồi Yêu Cầu Đổi Trả trong vòng tối đa 02 ngày làm việc.</li>\n            <li>Nếu yêu cầu hoàn trả đáp ứng điều kiện, CPFoods.vn sẽ thực hiện thủ tục hoàn tiền trong thời gian từ 5-15 ngày làm việc.</li>\n        </ul>\n        \n        <h2>IV. Phương thức đổi trả</h2>\n        <h3>1. Mang trực tiếp hàng hóa cần đổi trả đến Trung tâm đổi trả của CPFoods.vn</h3>\n        <p>Khách hàng vui lòng mang trực tiếp hàng hóa cần đổi trả đến Trung tâm đổi trả của CPFoods.vn tại địa chỉ sau:</p>\n        <p>- Tại TP Hồ Chí Minh: Trung tâm Dịch vụ Khách hàng – 419 Nơ Trang Long, p.13, q. Bình Thạnh, TP. HCM</p>\n        <p>- Tại Hà Nội, Đà Nẵng và các tỉnh/thành khác: thông báo sau</p>\n        \n        <h3>2. Mang hàng hóa cần đổi trả đến cửa hàng CPFoods.vn gần nhất hoặc cửa hàng mà khách hàng đã mua</h3>\n        \n        <h3>3. Thông tin liên hệ của TT Dịch vụ Khách hàng</h3>\n        <ul>\n            <li>Trung tâm Dịch vụ Khách hàng – 419 Nơ Trang Long, p.13, q. Bình Thạnh, TP. HCM</li>\n            <li>Điện thoại: (08) 62 58 44 52</li>\n            <li>Email: cskh@cpfoods.vn</li>\n        </ul>\n        \n        <h3>Phụ lục</h3>\n        <p>Danh mục Sản phẩm và Dịch vụ hạn chế đổi trả</p>\n    </div>\n</div>\n', '2.jpg', 'Chính sách đổi trả', '2024-08-31 10:11:40.000000', 'chinh-sach-doi-tra'),
(8, '<!DOCTYPE html>\n<html lang=\"vi\">\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Bài viết về Xử phạt hành chính</title>\n    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css\">\n</head>\n<body>\n    <div class=\"container mt-5\">\n        <div class=\"row\">\n            <div class=\"col-md-9\">\n                <header>\n                    <h1 class=\"h3 fw-bold title\">Xử phạt hành chính đối với cửa hàng bán đồ ăn nhanh vi phạm quy định về bảo quản thực phẩm như thế nào?</h1>\n                </header>\n                <section class=\"news-content\" id=\"news-content\">\n                    <strong class=\"d-block mt-3 mb-3 sapo\">\n                        Tôi cùng chị gái tôi dự định mở một cửa hàng chuyên bán về đồ ăn nhanh thuộc loại hình kinh doanh nhỏ lẻ, vậy thì cửa hàng tôi có phải xin cấp Giấy Chứng nhận cơ sở đủ điều kiện an toàn thực phẩm không? Tôi cần đảm bảo những điều kiện gì về vệ sinh an toàn thực phẩm? Trường hợp cửa hàng của tôi vi phạm quy định về bảo quản thực phẩm thì bị xử phạt như thế nào?\n                    </strong>\n                    <div class=\"accordion muc-luc\" id=\"accordionMucLuc\">\n                        <div class=\"accordion-item\">\n                            <div class=\"accordion-header\" id=\"headingOneMucLuc\">\n                                <button class=\"accordion-button p-2 pt-3 ps-3 title collapsed\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#collapseOneMucLuc\" aria-expanded=\"false\" aria-controls=\"collapseOneMucLuc\">\n                                    <div class=\"d-flex justify-content-center align-items-center w-100\">\n                                        <img src=\"https://cdn.thuvienphapluat.vn/images/mluc.png\" alt=\"Mục lục bài viết\" width=\"15\" height=\"13\" class=\"me-2 img-muc-luc\">\n                                        Nội dung chính\n                                    </div>\n                                </button>\n                            </div>\n                            <div id=\"collapseOneMucLuc\" class=\"accordion-collapse collapse\" aria-labelledby=\"headingOneMucLuc\" data-bs-parent=\"#accordionMucLuc\">\n                                <div class=\"accordion-body p-0 ps-3 pb-3\">\n                                    <ul>\n                                        <li>\n                                            <a href=\"#cua-hang-ban-do-an-nhanh-co-phai-xin-cap-giay-chung-nhan-co-so-du-dieu-kien-an-toan-thuc-pham-khong-0\" class=\"ps-0\" rel=\"nofollow\"><strong style=\"font-size: 12pt;\">Cửa hàng bán đồ ăn nhanh có phải xin cấp Giấy Chứng nhận cơ sở đủ điều kiện an toàn thực phẩm không?</strong></a>\n                                        </li>\n                                        <li>\n                                            <a href=\"#cua-hang-ban-do-an-nhanh-can-tuan-thu-nhung-dieu-kien-gi-ve-bao-dam-an-toan-thuc-pham-1\" class=\"ps-0\" rel=\"nofollow\"><strong style=\"font-size: 12pt;\">Cửa hàng bán đồ ăn nhanh cần tuân thủ những điều kiện gì về bảo đảm an toàn thực phẩm?</strong></a>\n                                        </li>\n                                        <li>\n                                            <a href=\"#muc-xu-phat-doi-voi-cua-hang-ban-do-an-nhanh-vi-pham-quy-dinh-ve-bao-quan-thuc-pham-la-bao-nhieu-2\" class=\"ps-0\" rel=\"nofollow\"><strong style=\"font-size: 12pt;\">Mức xử phạt đối với cửa hàng bán đồ ăn nhanh vi phạm quy định về bảo quản thực phẩm là bao nhiêu?</strong></a>\n                                        </li>\n                                    </ul>\n                                </div>\n                            </div>\n                        </div>\n                    </div>\n\n                    <h2 id=\"cua-hang-ban-do-an-nhanh-co-phai-xin-cap-giay-chung-nhan-co-so-du-dieu-kien-an-toan-thuc-pham-khong-0\"><strong style=\"font-size: 12pt;\">Cửa hàng bán đồ ăn nhanh có phải xin cấp Giấy Chứng nhận cơ sở đủ điều kiện an toàn thực phẩm không?</strong></h2>\n                    <p><img src=\"https://cdn.thuvienphapluat.vn//phap-luat/2022/TienThinh/200722/Cua-hang-ban-do-an-nhanh.jpg\" alt=\"Cửa hàng bán đồ ăn nhanh\"></p>\n                    <p style=\"text-align: center;\"><em>Cửa hàng bán đồ ăn nhanh (Hình từ Internet)</em></p>\n                    <p>Theo quy định tại <a href=\"https://thuvienphapluat.vn/van-ban/The-thao-Y-te/Nghi-dinh-15-2018-ND-CP-huong-dan-Luat-an-toan-thuc-pham-341254.aspx?anchor=diem_d_1_12\" rel=\"noopener noreferrer\" target=\"_blank\">khoản 1 Điều 12 Nghị định 15/2018/NĐ-CP</a> có quy định về các Cơ sở không thuộc diện cấp Giấy chứng nhận cơ sở đủ điều kiện an toàn thực phẩm như sau:</p>\n                    <blockquote><em>\"Điều 12. Cơ sở không thuộc diện cấp Giấy chứng nhận cơ sở đủ điều kiện an toàn thực phẩm</em></blockquote>\n                    <blockquote><em>1. Các cơ sở sau đây không thuộc diện cấp Giấy chứng nhận cơ sở đủ điều kiện an toàn thực phẩm:</em></blockquote>\n                    <blockquote><em>a) Sản xuất ban đầu nhỏ lẻ;</em></blockquote>\n                    <blockquote><em>b) Sản xuất, kinh doanh thực phẩm không có địa điểm cố định;</em></blockquote>\n                    <blockquote><em>c) Sơ chế nhỏ lẻ;</em></blockquote>\n                    <blockquote><strong><em>d) Kinh doanh thực phẩm nhỏ lẻ;</em></strong></blockquote>\n                    <blockquote><em>đ) Kinh doanh thực phẩm bao gói sẵn;</em></blockquote>\n                    <blockquote><em>e) Sản xuất, kinh doanh dụng cụ, vật liệu bao gói, chứa đựng thực phẩm;</em></blockquote>\n                    <blockquote><em>g) Nhà hàng trong khách sạn;</em></blockquote>\n                    <blockquote><em>h) Bếp ăn tập thể không có đăng ký ngành nghề kinh doanh thực phẩm;</em></blockquote>\n                    <blockquote><em>i) Kinh doanh thức ăn đường phố;\"</em></blockquote>\n                    <p>Về cơ sở sản xuất thực phẩm nhỏ lẻ được hướng dẫn bởi <a href=\"https://thuvienphapluat.vn/cong-van/The-thao-Y-te/Cong-van-3109-BCT-KHCN-2018-huong-dan-thuc-hien-cong-tac-quan-ly-an-toan-thuc-pham-384696.aspx?anchor=khoan_1\" rel=\"noopener noreferrer\" target=\"_blank\">khoản 1 Công văn 3109/BCT-KHCN năm 2018</a> như sau:</p>\n                    <blockquote><em>\"1. Cơ sở sản xuất thực phẩm nhỏ lẻ</em></blockquote>\n                    <blockquote><em>Theo quy định tại khoản 16 Điều 4 Luật Doanh nghiệp khái niệm “kinh doanh” được hiểu “là việc thực hiện liên tục một, một số hoặc tất cả các công đoạn của quá trình đầu tư, từ sản xuất đến tiêu thụ sản phẩm hoặc cung ứng dịch vụ trên thị trường nhằm mục đích sinh lợi”. Do đó, sản xuất thực phẩm nhỏ lẻ là một công đoạn trong hoạt động kinh doanh thực phẩm nhỏ lẻ.\"</em></blockquote>\n                    <p>Từ các quy định tại khoản 10 Điều 3, <a href=\"https://thuvienphapluat.vn/van-ban/The-thao-Y-te/Nghi-dinh-15-2018-ND-CP-huong-dan-Luat-an-toan-thuc-pham-341254.aspx?anchor=diem_d_1_12\" rel=\"noopener noreferrer\" target=\"_blank\">khoản 1 Điều 12 Nghị định 15/2018/NĐ-CP</a> thì cửa hàng bán đồ ăn nhanh thuộc loại hình kinh doanh nhỏ lẻ không thuộc diện cấp Giấy Chứng nhận cơ sở đủ điều kiện an toàn thực phẩm.</p>\n\n                    <h2 id=\"cua-hang-ban-do-an-nhanh-can-tuan-thu-nhung-dieu-kien-gi-ve-bao-dam-an-toan-thuc-pham-1\"><strong style=\"font-size: 12pt;\">Cửa hàng bán đồ ăn nhanh cần tuân thủ những điều kiện gì về bảo đảm an toàn thực phẩm?</strong></h2>\n                    <p>Cửa hàng bán đồ ăn nhanh phải tuân thủ các điều kiện bảo đảm an toàn thực phẩm quy định tại <a href=\"https://thuvienphapluat.vn/van-ban/Thuong-mai/Luat-an-toan-thuc-pham-2010-108074.aspx?anchor=dieu_22\" rel=\"noopener noreferrer\" target=\"_blank\">Điều 22 Luật an toàn thực phẩm 2010</a> như sau:</p>\n                    <blockquote><em>\"Điều 22. Điều kiện bảo đảm an toàn đối với thực phẩm trong sản xuất, kinh doanh thực phẩm nhỏ lẻ</em></blockquote>\n                    <blockquote><em>1. Có khoảng cách an toàn đối với nguồn gây độc hại, nguồn gây ô nhiễm;</em></blockquote>\n                    <blockquote><em>2. Có đủ nước đạt quy chuẩn kỹ thuật phục vụ sản xuất, kinh doanh thực phẩm;</em></blockquote>\n                    <blockquote><em>3. Có đủ trang thiết bị, dụng cụ phù hợp để chế biến, xử lý, đóng gói, bảo quản và vận chuyển từng loại thực phẩm; có thiết bị, dụng cụ, phương tiện rửa và khử trùng, sát trùng;</em></blockquote>\n                    <blockquote><em>4. Có hệ thống thông gió, hệ thống chiếu sáng và điều kiện bảo đảm vệ sinh khác;</em></blockquote>\n                    <blockquote><em>5. Người trực tiếp sản xuất, kinh doanh thực phẩm phải có Giấy xác nhận kiến thức về an toàn thực phẩm và Giấy chứng nhận đủ sức khỏe do cơ sở y tế cấp huyện trở lên cấp;</em></blockquote>\n                    <blockquote><em>6. Tuân thủ quy định về lưu mẫu thức ăn.\".</em></blockquote>\n                    <p>Như vậy, cửa hàng bán đồ ăn nhanh cần tuân thủ các điều kiện bảo đảm an toàn thực phẩm như trên.</p>\n\n                    <h2 id=\"muc-xu-phat-doi-voi-cua-hang-ban-do-an-nhanh-vi-pham-quy-dinh-ve-bao-quan-thuc-pham-la-bao-nhieu-2\"><strong style=\"font-size: 12pt;\">Mức xử phạt đối với cửa hàng bán đồ ăn nhanh vi phạm quy định về bảo quản thực phẩm là bao nhiêu?</strong></h2>\n                    <p>Về mức xử phạt vi phạm hành chính đối với cửa hàng bán đồ ăn nhanh vi phạm quy định về bảo quản thực phẩm được quy định tại <a href=\"https://thuvienphapluat.vn/van-ban/Vi-pham-hanh-chinh/Nghi-dinh-115-2018-ND-CP-xu-phat-vi-pham-hanh-chinh-ve-an-toan-thuc-pham-366097.aspx?anchor=diem_a_2_8\" rel=\"noopener noreferrer\" target=\"_blank\">điểm a khoản 2 Điều 8 Nghị định 115/2018/NĐ-CP</a> như sau:</p>\n                    <blockquote><em>\"Điều 8. Vi phạm quy định về bảo quản thực phẩm trong sản xuất, kinh doanh thực phẩm</em></blockquote>\n                    <blockquote><em>1. Phạt tiền từ 1.000.000 đồng đến 3.000.000 đồng đối với một trong các hành vi vi phạm sau đây:</em></blockquote>\n                    <blockquote><em>a) Sử dụng thiết bị, dụng cụ bảo quản không bảo đảm vệ sinh trong quá trình bảo quản thực phẩm;</em></blockquote>\n                    <blockquote><em>b) Bảo quản thực phẩm không đúng nhiệt độ theo hướng dẫn của tổ chức, cá nhân sản xuất, cung cấp thực phẩm;</em></blockquote>\n                    <blockquote><em>c) Thực phẩm bảo quản không đúng khoảng cách theo quy định.</em></blockquote>\n                    <blockquote><em>2. Phạt tiền từ 3.000.000 đồng đến 5.000.000 đồng đối với một trong các hành vi vi phạm sau đây:</em></blockquote>\n                    <blockquote><em>a) Sử dụng phương tiện bảo quản không bảo đảm vệ sinh trong quá trình bảo quản thực phẩm;</em></blockquote>\n                    <blockquote><em>b) Bảo quản thực phẩm chung với hàng hóa độc hại khác.\"</em></blockquote>\n                    <p>Như vậy, cửa hàng bán đồ ăn nhanh vi phạm quy định về bảo quản thực phẩm sẽ bị phạt tiền từ 1.000.000 đồng đến 5.000.000 đồng.</p>\n                </section>\n            </div>\n\n            <div class=\"col-md-3\">\n                <h4>Danh mục liên quan</h4>\n                <ul>\n                    <li><a href=\"#\">An toàn thực phẩm</a></li>\n                    <li><a href=\"#\">Xử phạt hành chính</a></li>\n                    <li><a href=\"#\">Quy định pháp luật</a></li>\n                    <li><a href=\"#\">Kinh doanh</a></li>\n                </ul>\n            </div>\n        </div>\n    </div>\n\n    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js\"></script>\n</body>\n</html>\n', '3.jpg', 'Chính sách bảo hàng', '2024-08-31 10:12:08.000000', 'chinh-sach-bao-hang'),
(9, '<div class=\"entry-content entry_content__page__detail_new\">\n    <div class=\"entry-title\">\n        <h1 class=\"page_detail__new__title\">CHÍNH SÁCH GIAO – NHẬN HÀNG</h1>\n    </div>\n\n    <div class=\"page_detail__news--image\">\n        <figure>\n            <img class=\"lazy entered loaded\" data-src=\"https://cdnbiz.abphotos.link/photos/resized/1000x/2023/03/17/1679037099_8woMudWfB7GNji1O_1679046234-phphyimar.png\" alt=\"news-image\" src=\"https://cdnbiz.abphotos.link/photos/resized/1000x/2023/03/17/1679037099_8woMudWfB7GNji1O_1679046234-phphyimar.png\">\n        </figure>\n    </div>\n\n    <div class=\"wysiwyg full-content js-full-content\">\n        <h2><strong>1. Phạm vi áp dụng:</strong></h2>\n        <p>Phạm vi áp dụng: Nội thành Hà Nội</p>\n\n        <h2><strong>2. Thời gian giao - nhận hàng:</strong></h2>\n        <p>- Trong vòng 10 phút sau khi quý khách đặt đơn, FoodHub sẽ gọi điện xác nhận đơn hàng và tư vấn sản phẩm.</p>\n        <p>- FoodHub bắt đầu đóng hàng trong vòng 30 phút kể từ khi xác nhận đơn.</p>\n        <p>- Sau 1 giờ đồng hồ sản phẩm đã sẵn sàng giao đến khách hàng.</p>\n        <p>- Trường hợp có yêu cầu sơ chế, thời gian sẵn sàng giao hàng có thể sẽ lâu hơn nhưng không quá 2 giờ đồng hồ.</p>\n        <p>- FoodHub chỉ cung cấp dịch vụ tại khu vực nội thành Hà Nội.</p>\n\n        <h2><strong>3. Chính sách khách hàng:</strong></h2>\n        <p>Từ ngày 5/5/2021, FoodHub ra mắt nhiều chương trình ưu đãi dành cho Quý khách hàng với mong muốn đem lại trải nghiệm mua sắm tốt nhất:</p>\n\n        <h3><strong><em>Ưu đãi Voucher (dành cho khách hàng tải App lần đầu)</em></strong></h3>\n        <ul>\n            <li>Đơn hàng trên 300K được giảm 50K.</li>\n            <li>Đơn hàng trên 200K được giảm 30K.</li>\n        </ul>\n\n        <h3><strong><em>Ưu đãi phí ship</em></strong></h3>\n        <ul>\n            <li>Đơn hàng từ 1 triệu trở lên được hỗ trợ 50K phí ship.</li>\n            <li>Đơn hàng từ 800K trở lên được hỗ trợ 30K phí ship.</li>\n            <li>Đơn hàng từ 500K đến 800K được hỗ trợ 20K phí ship.</li>\n            <li>Đơn hàng từ 200K – 500K được hỗ trợ 10K phí ship.</li>\n        </ul>\n\n        <h3><strong><em>Chính sách tích điểm và đổi điểm</em></strong></h3>\n        <ul>\n            <li>Khách hàng nhận được 1 điểm tương đương 1000đ khi thanh toán, có thể dùng điểm để thanh toán cho đơn hàng tiếp theo.</li>\n            <li>2200 điểm đổi được 50.000 VNĐ.</li>\n            <li>1500 điểm đổi được 30.000 VNĐ.</li>\n            <li>1000 điểm đổi được 10.000 VNĐ.</li>\n        </ul>\n\n        <h3><strong><em>Chính sách bảo hành</em></strong></h3>\n        <p>Khi mua sản phẩm tại FoodHub, khách hàng sẽ được bảo hành trong 12 tiếng. Nếu sản phẩm bị hỏng, dập nát,… hãy gọi ngay cho chúng tôi theo số hotline để được hỗ trợ.</p>\n\n        <p style=\"text-align:right\"><strong>HOTLINE: 088.830.1518<br>EMAIL: CONTACT@FOODHUB.VN</strong></p>\n    </div>\n</div>\n', '4.jpg', 'Chính sách vận chuyển', '2024-08-31 10:12:34.000000', 'chinh-sach-van-chuyen');

-- --------------------------------------------------------

--
-- Table structure for table `address`
--

CREATE TABLE `address` (
  `id` bigint(20) NOT NULL,
  `city` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `postal_code` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `street_address` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `address`
--

INSERT INTO `address` (`id`, `city`, `country`, `full_name`, `postal_code`, `state`, `street_address`) VALUES
(1, '12', '', NULL, 'sá', NULL, '7'),
(2, 'Mountain View', 'India', 'tinhco', '940437', 'CA', '1600 Amphitheatre Parkway'),
(3, '12', 'India', 'tinhco', '806366', 'đá', '7'),
(4, '12', 'India', 'tinhco', '806366', 'đá', '7'),
(5, '12', 'India', 'Phùng ngọc Toàn', '806366', 'đá', '7'),
(6, 'Mountain View', 'India', 'Phùng ngọc Toàn', '940439', 'CA', '1600 Amphitheatre Parkway'),
(7, '12', 'India', 'Phùng ngọc Toàn', '806369', 'đá', '7'),
(8, '12', 'India', 'Phùng ngọc Toàn', '806368', 'tẻt', '7'),
(9, '12', 'India', 'Phùng ngọc Toàn', '806364', 'ewq', '7'),
(10, '12', 'India', 'Phùng ngọc Toàn', '806363', 'đá', '7'),
(11, '12', 'India', 'Phùng ngọc Toàn', '806363', 'đá', '7'),
(12, '12', 'India', 'Phùng ngọc Toàn', '806363', 'CA', '7'),
(13, '12', 'India', 'Phùng ngọc Toàn', '806363', 'đá', '7'),
(14, '12', 'India', 'Phùng ngọc Toàn', '806363', 'đá', '7'),
(15, 'Mountain View', 'Hoa Kỳ', NULL, '94043', NULL, '1600 Amphitheatre Parkway'),
(16, '12', 'India', 'Phùng ngọc Toàn', '806366', 'ds', '7'),
(17, '12', 'India', 'Phùng ngọc Toàn', '806366', 'ds', '7'),
(18, '12', 'Vietnamese', 'Phùng ngọc Toàn', '806366', 'CA', '7'),
(19, '12', 'Vietnamese', 'tinhco', '806364', 'CA', '7'),
(20, '12', 'Vietnamese', 'Phùng ngọc Toàn', '806366', 'ewq', '7'),
(21, '12', 'Việt Nam', 'tinhco', '806366', 'CA', '7'),
(22, '12', 'Việt Nam', 'tinhco', '806366', 'CA', '7'),
(23, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', '7,  Phường Hòa Hiệp Nam,  Quận Liên Chiểu,  Thành phố Đà Nẵng'),
(24, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', '   Tỉnh An Giang'),
(25, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', ''),
(26, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', ''),
(27, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', '12,  Xã Đình Phong,  Huyện Trùng Khánh,  Tỉnh Cao Bằng'),
(28, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', '213,  Xã Hòa Mỹ Tây,  Huyện Tây Hoà,  Tỉnh Phú Yên, 123trty'),
(29, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', ''),
(30, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', ''),
(31, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', ''),
(32, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', ''),
(33, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', ''),
(34, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', ''),
(35, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', ''),
(36, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', '12,  Xã An Trạch,  Huyện Đông Hải,  Tỉnh Bạc Liêu, 132345'),
(37, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', '12,  Xã An Trạch,  Huyện Đông Hải,  Tỉnh Bạc Liêu, 132345'),
(38, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', ''),
(39, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', '12,  Xã Hùng An,  Huyện Bắc Quang,  Tỉnh Hà Giang, 122543'),
(40, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', '12,  Xã Bình Phú,  Huyện Châu Phú,  Tỉnh An Giang, 132345'),
(41, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', ''),
(42, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', ' Xã Kiến Quốc,  Huyện Kiến Thuỵ,  Thành phố Hải Phòng'),
(43, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', ' Xã Kiến Quốc,  Huyện Kiến Thuỵ,  Thành phố Hải Phòng'),
(44, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', ' Xã Kiến Quốc,  Huyện Kiến Thuỵ,  Thành phố Hải Phòng'),
(45, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', ' Xã Kiến Quốc,  Huyện Kiến Thuỵ,  Thành phố Hải Phòng'),
(46, '', 'Việt Nam', 'Phùng ngọc Toàn', '', '', ' Xã Kiến Quốc,  Huyện Kiến Thuỵ,  Thành phố Hải Phòng'),
(47, '', 'Việt Nam', 'tinhco', '', '', '12,  Xã Gia Minh,  Huyện Thuỷ Nguyên,  Thành phố Hải Phòng'),
(48, '', 'Việt Nam', 'tinhco', '', '', ''),
(49, '', 'Việt Nam', 'tinhco', '999999', '', '54,  Xã Khánh Bình,  Huyện An Phú,  Tỉnh An Giang, 132345'),
(50, '', 'Việt Nam', 'tinhco', '999999', '', ''),
(51, '', 'Việt Nam', 'tinhco', '', '', ''),
(52, '', 'Việt Nam', 'tinhco', '', '', ''),
(53, '', 'Việt Nam', 'tinhco', '', '', ''),
(54, '', 'Việt Nam', 'tinhco', '', '', '12, Xã Khánh Bình, Huyện An Phú, Tỉnh An Giang, 123456'),
(55, '', 'Việt Nam', 'tinhco', '', '', ''),
(56, '', 'Việt Nam', 'tinhco', '', '', ''),
(57, '', 'Việt Nam', 'tinhco', '', '', '12,  Xã Đá Bạc,  Huyện Châu Đức,  Tỉnh Bà Rịa - Vũng Tàu, 1234'),
(58, '', 'Việt Nam', 'tinhco', '', '', '12,  Xã An Phú Trung,  Huyện Ba Tri,  Tỉnh Bến Tre, 1234'),
(59, 'Huyện An Phú', 'Việt Nam', 'tinhco', '1235', 'Tỉnh An Giang', '12, Xã Khánh Bình, Huyện An Phú, Tỉnh An Giang'),
(60, NULL, 'Việt Nam', 'tinhco', NULL, NULL, NULL),
(61, 'Quận 1', 'Việt Nam', 'tinhco', '12345', 'Thành phố Hồ Chí Minh', '12, Phường Bến Nghé, Quận 1, Thành phố Hồ Chí Minh'),
(62, NULL, 'Việt Nam', 'tinhco', NULL, NULL, NULL),
(63, NULL, 'Việt Nam', 'Phùng ngọc Toàn', NULL, NULL, NULL),
(64, 'Huyện Châu Phú', 'Việt Nam', 'tinhco', '32454', 'Tỉnh An Giang', '12, Xã Bình Mỹ, Huyện Châu Phú, Tỉnh An Giang'),
(65, NULL, 'Việt Nam', 'tinhco', NULL, NULL, NULL),
(66, 'Huyện An Phú', 'Việt Nam', 'tinhco', '786621', 'Tỉnh An Giang', '12, Xã Khánh Bình, Huyện An Phú, Tỉnh An Giang'),
(67, NULL, 'Việt Nam', 'tinhco', NULL, NULL, NULL),
(68, NULL, 'Việt Nam', 'tinhco', NULL, NULL, NULL),
(69, NULL, 'Việt Nam', 'tinhco', NULL, NULL, NULL),
(70, NULL, 'Việt Nam', 'tinhco', NULL, NULL, NULL),
(71, NULL, 'Việt Nam', 'tinhco', NULL, NULL, NULL),
(72, NULL, 'Việt Nam', 'tinhco', NULL, NULL, NULL),
(73, NULL, 'Việt Nam', 'tinhco', NULL, NULL, NULL),
(74, 'Huyện Mê Linh', 'Việt Nam', 'Phùng ngọc Toàn', '41234', 'Thành phố Hà Nội', '12, Xã Tam Đồng, Huyện Mê Linh, Thành phố Hà Nội'),
(75, 'Huyện Mê Linh', 'Việt Nam', 'Phùng ngọc Toàn', '41234', 'Thành phố Hà Nội', '12, Xã Tam Đồng, Huyện Mê Linh, Thành phố Hà Nội'),
(76, 'Huyện Đất Đỏ', 'Việt Nam', 'Phùng ngọc Toàn', '23145', 'Tỉnh Bà Rịa - Vũng Tàu', '12, Thị trấn Phước Hải, Huyện Đất Đỏ, Tỉnh Bà Rịa - Vũng Tàu'),
(77, 'Quận 11', 'Việt Nam', 'tinhco', '12345', 'Thành phố Hồ Chí Minh', '12, Phường 07, Quận 11, Thành phố Hồ Chí Minh'),
(78, NULL, 'Việt Nam', 'Phùng ngọc Toàn', NULL, NULL, NULL),
(79, 'Huyện Châu Đức', 'Việt Nam', 'Phùng ngọc Toàn', '12345', 'Tỉnh Bà Rịa - Vũng Tàu', '12, Xã Bình Giã, Huyện Châu Đức, Tỉnh Bà Rịa - Vũng Tàu'),
(80, NULL, 'Việt Nam', 'Phùng ngọc Toàn', NULL, NULL, NULL),
(81, NULL, 'Việt Nam', 'Phùng ngọc Toàn', NULL, NULL, NULL),
(82, NULL, 'Việt Nam', 'Phùng ngọc Toàn', NULL, NULL, NULL),
(83, 'Huyện Hiệp Hòa', 'Việt Nam', 'Phùng ngọc Toàn', '12345', 'Tỉnh Bắc Giang', '12, Xã Đức Thắng, Huyện Hiệp Hòa, Tỉnh Bắc Giang'),
(84, NULL, 'Việt Nam', 'Phùng ngọc Toàn', NULL, NULL, NULL),
(85, 'Huyện An Lão', 'Việt Nam', 'Phùng ngọc Toàn', '12345', 'Thành phố Hải Phòng', '43, Xã Bát Trang, Huyện An Lão, Thành phố Hải Phòng'),
(86, 'Huyện Châu Đức', 'Việt Nam', 'Phùng ngọc Toàn', '12345', 'Tỉnh Bà Rịa - Vũng Tàu', '12, Xã Bình Trung, Huyện Châu Đức, Tỉnh Bà Rịa - Vũng Tàu'),
(87, 'Huyện An Phú', 'Việt Nam', 'Phùng ngọc Toàn', '12345', 'Tỉnh An Giang', '213, Xã Đa Phước, Huyện An Phú, Tỉnh An Giang'),
(88, 'Quận 9', 'Việt Nam', 'tinhco', '12345', 'Thành phố Hồ Chí Minh', '12, Phường Phước Long B, Quận 9, Thành phố Hồ Chí Minh'),
(89, NULL, 'Việt Nam', 'Phùng ngọc Toàn', NULL, NULL, NULL),
(90, NULL, 'Việt Nam', 'Phùng ngọc Toàn', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL,
  `total` bigint(20) DEFAULT NULL,
  `customer_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cart`
--

INSERT INTO `cart` (`id`, `total`, `customer_id`) VALUES
(1, NULL, 1),
(2, NULL, 2),
(4, NULL, 102),
(5, NULL, 103),
(6, NULL, 152),
(7, NULL, 202),
(8, NULL, 252),
(12, NULL, 305),
(13, NULL, 352),
(14, NULL, 353);

-- --------------------------------------------------------

--
-- Table structure for table `cart_item`
--

CREATE TABLE `cart_item` (
  `id` bigint(20) NOT NULL,
  `ingredients` varbinary(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` bigint(20) DEFAULT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `food_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `restaurant_id` bigint(20) DEFAULT NULL,
  `image_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `name`, `restaurant_id`, `image_url`) VALUES
(1, 'Cuốn Trứng', 1, '/images/category/1.jpg'),
(2, 'Nước chấm', 1, '/images/category/2.jpg'),
(3, 'Cơm Chiên', 1, '/images/category/3.jpg'),
(4, 'Bánh ngọt', 1, '/images/category/4.jpg'),
(6, 'Cơm', 1, '/images/category/5.jpg'),
(7, 'Bánh mì kẹp thịt', 1, '/images/category/7.jpg'),
(8, 'Pizza', 1, '/images/category/8.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `contact_messages`
--

CREATE TABLE `contact_messages` (
  `id` bigint(20) NOT NULL,
  `content` varchar(255) DEFAULT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `is_replied` bit(1) NOT NULL,
  `replied_at` datetime(6) DEFAULT NULL,
  `reply_content` mediumtext DEFAULT NULL,
  `sender_name` varchar(30) DEFAULT NULL,
  `subject` varchar(255) DEFAULT NULL,
  `address` varchar(255) DEFAULT NULL,
  `phone` varchar(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `contact_messages`
--

INSERT INTO `contact_messages` (`id`, `content`, `created_at`, `email`, `is_replied`, `replied_at`, `reply_content`, `sender_name`, `subject`, `address`, `phone`) VALUES
(24, 'Tôi muốn hỏi thêm về sản phẩm thường dùng', '2024-08-20 10:38:44.000000', 'garenariotgame@gmail.com', b'1', '2024-08-20 10:40:43.000000', 'đơn hàng của bạn sẽ được giao trong vòng 3-5 ngày làm việc kể từ khi xác nhận. Bạn có thể theo dõi trạng thái đơn hàng trên website của chúng tôi hoặc liên hệ qua số hotline nếu có bất kỳ thắc mắc nào.', 'Nguyễn Đức Hiếu', 'Dịch vụ của chúng tôi', '123 Đường ABC, Hà Nội', '0968894336'),
(44, 'tôi là tuân úc đầu quân cho Tao Tháo 20 năm ', '2024-08-20 22:55:47.000000', 'phungtoan872@gmail.com', b'0', '2024-08-20 22:55:47.000000', NULL, 'Tuân úc', '', '123, abc', '0968894336'),
(45, 'Tình yêu của tôi như biển và núi tôi và biển còn người kia là núi ', '2024-08-20 23:00:25.000000', 'phungtoan872@gmail.com', b'0', '2024-08-20 23:00:25.000000', NULL, 'ĐiêuThuyền', '', '123, xyz, Hán', '0821931312'),
(47, 'bán chúa cầu dinh', '2024-08-25 14:24:01.000000', 'phungtoan872@gmail.com', b'1', '2024-08-25 14:26:24.000000', 'Tôi sẻ đánh trong vòng hôm nay', 'Tuân úc', '', 'phương Nam', '0987654321'),
(50, 'Không có gì phải bàn', '2024-09-02 14:38:35.000000', 'masieu@gmail.com', b'1', '2024-09-02 14:39:01.000000', 'cảm ơn bạn đã quan tâm đến sản phẩm của chúng tôi', 'Mã Siêu', 'Bàn về chiến sự mới', '123, xyz, Ichs Châu', '0989281231'),
(51, 'Đánh Kinh Châu lấy lại đất ', '2024-09-02 14:40:26.000000', 'phungtoan872@gmail.com', b'1', '2024-09-02 14:40:36.000000', 'cảm ơn bạn đã quan tâm đến sản phẩm của chúng tôi', 'Túc Hạ ', 'Thuyền Chiến', '123, xyz, abc', '0987655431');

-- --------------------------------------------------------

--
-- Table structure for table `coupon`
--

CREATE TABLE `coupon` (
  `id` bigint(20) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `discount_amount` double NOT NULL,
  `terms_and_conditions` varchar(255) DEFAULT NULL,
  `validity_period` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `events`
--

CREATE TABLE `events` (
  `id` bigint(20) NOT NULL,
  `ends_at` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `location` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `started_at` varchar(255) DEFAULT NULL,
  `restaurant_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events`
--

INSERT INTO `events` (`id`, `ends_at`, `image`, `location`, `name`, `started_at`, `restaurant_id`) VALUES
(1, 'July 24, 2024 12:00 AM', 'https://cybershow.vn/wp-content/uploads/2018/11/gem-center-640x480.jpg', 'haa', 'Tình Cờ', 'July 30, 2024 12:00 AM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `events_seq`
--

CREATE TABLE `events_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `events_seq`
--

INSERT INTO `events_seq` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` bigint(20) NOT NULL,
  `food_id` bigint(20) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `food_id`, `user_id`) VALUES
(63, 20, 2),
(64, 18, 2),
(66, 17, 2),
(69, 2, 1),
(70, 1, 1),
(73, 2, 2),
(77, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `food`
--

CREATE TABLE `food` (
  `id` bigint(20) NOT NULL,
  `available` bit(1) NOT NULL,
  `creation_date` datetime(6) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `is_seasonal` bit(1) NOT NULL,
  `is_vegetarian` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` bigint(20) DEFAULT NULL,
  `food_category_id` bigint(20) DEFAULT NULL,
  `restaurant_id` bigint(20) DEFAULT NULL,
  `is_discounted` bit(1) NOT NULL,
  `is_new` bit(1) NOT NULL,
  `is_popular` bit(1) NOT NULL,
  `rating` int(11) NOT NULL,
  `detail` text DEFAULT NULL,
  `discounted_price` bigint(20) DEFAULT NULL,
  `is_favorite` bit(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food`
--

INSERT INTO `food` (`id`, `available`, `creation_date`, `description`, `is_seasonal`, `is_vegetarian`, `name`, `price`, `food_category_id`, `restaurant_id`, `is_discounted`, `is_new`, `is_popular`, `rating`, `detail`, `discounted_price`, `is_favorite`) VALUES
(1, b'1', '2024-07-30 18:15:16.000000', 'Một chiếc bánh tròn, có đế mỏng được phủ sốt cà chua, phô mai và các loại topping khác nhau.', b'0', b'1', 'Pizza (Italy)', 20000, 1, 1, b'0', b'0', b'1', 2, 'Pizza là một món ăn nhanh yêu thích trên toàn thế giới có nguồn gốc từ Ý. Bánh pizza Margherita cổ điển, với topping đơn giản gồm cà chua tươi, phô mai mozzarella và lá húng quế, thể hiện màu sắc của lá cờ Ý. Theo thời gian, pizza đã phát triển với nhiều phiên bản khu vực khác nhau như pizza đế dày kiểu Mỹ, nổi tiếng với lớp vỏ dày và lớp phô mai dày, và pizza Neapolitan với vỏ mỏng, giòn và hơi cháy xém. Topping có thể từ các lựa chọn truyền thống như pepperoni và nấm đến những tùy chọn độc đáo như dứa hay dầu nấm truffle.', 10000, b'0'),
(2, b'1', '2024-07-31 00:11:00.000000', ' Burger, biểu tượng của đồ ăn nhanh Mỹ, đã trở thành món ăn quen thuộc trên toàn cầu. Thông thường, một chiếc burger bao gồm một miếng thịt bò xay được nướng chín, thường được phủ phô mai, rau xà lách, cà chua, và hành tây, kèm theo các loại sốt như ketch', b'0', b'1', 'Burger ', 15000, 1, 1, b'0', b'1', b'1', 4, 'Burger, biểu tượng của đồ ăn nhanh Mỹ, đã trở thành món ăn quen thuộc trên toàn cầu. Thông thường, một chiếc burger bao gồm một miếng thịt bò xay được nướng chín, thường được phủ phô mai, rau xà lách, cà chua, và hành tây, kèm theo các loại sốt như ketchup, mayonnaise. Burger có thể có nhiều biến thể, từ những chiếc burger cổ điển đến các phiên bản sáng tạo với thịt gà, cá, hoặc các loại patty chay.', 9000, b'1'),
(6, b'1', '2024-08-08 14:44:01.000000', 'Một loại bánh làm từ bột ngô hoặc bột mì, cuộn lại với nhân thịt, đậu, phô mai, và các loại sốt.', b'1', b'1', 'Taco (Mexico)', 15000, 1, 1, b'0', b'1', b'1', 4, 'Taco là một món ăn nhanh phổ biến của Mexico, được yêu thích bởi hương vị phong phú và tính linh hoạt trong cách chế biến. Một chiếc taco truyền thống thường được làm từ một miếng bánh tortilla mỏng, được nướng giòn hoặc mềm, sau đó được cuộn lại với nhân thịt nướng, đậu, rau củ, phô mai, và các loại sốt như salsa, guacamole, và crema. Taco có thể được biến tấu với nhiều loại nhân khác nhau, từ thịt bò, gà, cá, đến các loại nhân chay như nấm và đậu hầm.', 7000, b'0'),
(7, b'1', '2024-08-08 15:02:01.000000', 'Một loại xúc xích được kẹp trong bánh mì dài, thường được thêm vào hành, dưa chuột muối, và các loại sốt.', b'0', b'0', 'Hot Dog ', 50000, 1, 1, b'0', b'1', b'0', 4, 'Hot Dog là một món ăn nhanh biểu tượng của nước Mỹ, thường thấy tại các sự kiện thể thao và các quầy hàng đường phố. Một chiếc Hot Dog cơ bản gồm một miếng xúc xích dài được nướng hoặc luộc chín, kẹp trong một chiếc bánh mì mềm. Tùy theo sở thích, người ta có thể thêm hành tây băm nhỏ, dưa chuột muối, phô mai, và các loại sốt như ketchup, mustard. Hot Dog cũng có nhiều biến thể, từ kiểu Chicago với nhiều lớp topping đến kiểu New York với chỉ hành tây và mù tạt.', 30000, b'0'),
(8, b'1', '2024-08-08 15:07:42.000000', 'Một loại bánh mì baguette với nhân thịt, pate, rau, và sốt mayonnaise.', b'0', b'0', 'Bánh mì (Việt Nam)', 60000, 1, 1, b'0', b'0', b'0', 5, 'Bánh mì là một món ăn nhanh đặc trưng của Việt Nam, kết hợp hoàn hảo giữa ảnh hưởng của ẩm thực Pháp và hương vị địa phương. Chiếc bánh mì truyền thống thường gồm vỏ bánh mì baguette giòn rụm, bên trong là nhân thịt (thường là thịt lợn nướng, chả lụa, hoặc thịt nguội), pate, rau củ như dưa chuột, cà rốt ngâm chua, và rau mùi, cùng với một lớp sốt mayonnaise đậm đà. Bánh mì không chỉ là một món ăn sáng tiện lợi mà còn là một biểu tượng của văn hóa ẩm thực Việt Nam.', 45000, b'0'),
(9, b'0', '2024-08-08 15:09:06.000000', 'Thịt nướng xiên que, thường được phục vụ với bánh mì pita hoặc cơm.', b'0', b'0', 'Kebab (Thổ Nhĩ Kỳ)', 20000, 1, 1, b'1', b'1', b'1', 5, ' Kebab là một món ăn nhanh phổ biến có nguồn gốc từ Thổ Nhĩ Kỳ và Trung Đông. Thịt, thường là thịt cừu, bò hoặc gà, được tẩm ướp gia vị và nướng trên lửa than cho đến khi chín vàng. Kebab có nhiều loại khác nhau như Doner Kebab (thịt nướng xoay) hoặc Shish Kebab (thịt xiên nướng). Món này thường được phục vụ với bánh mì pita mềm hoặc cơm, cùng với các loại rau củ tươi, hành tây, và sốt yogurt. Kebab là một sự kết hợp hoàn hảo giữa thịt nướng thơm lừng và các nguyên liệu tươi ngon.', NULL, b'0'),
(17, b'1', '2024-08-23 07:56:16.000000', 'Thịt nướng cắt lát mỏng, cuộn trong bánh mì pita với rau và sốt tahini.', b'0', b'1', 'Shawarma (Trung Đông)', 12000, 2, 1, b'1', b'1', b'1', 2, 'Shawarma là một món ăn đường phố phổ biến ở Trung Đông, được làm từ thịt (thường là thịt cừu, bò, gà) được nướng từ từ trên lò xoay. Thịt được thái lát mỏng và cuộn trong bánh mì pita mềm, kèm theo các loại rau tươi, dưa chuột muối, và sốt tahini hoặc sốt garlic. Shawarma có hương vị đậm đà từ các loại gia vị như cumin, coriander, và garlic, tạo nên một món ăn nhanh thơm ngon và bổ dưỡng.', NULL, b'0'),
(18, b'1', '2024-08-23 07:58:24.000000', 'là một loại thức ăn bao gồm bánh mì kẹp thịt xay (thường là thịt bò) ở giữa. Miếng thịt có thể được nướng, chiên, hun khói hay nướng trên lửa.', b'0', b'1', 'Hamburger', 40000, 2, 1, b'1', b'0', b'0', 4, 'Hamburger là tên gọi dùng để chỉ một loại bánh mì kẹp gồm 2 phần bánh với phần nhân là sa lát kẹp cùng thịt hun khói, thịt bò hay pate. Phần thịt này thường đã được làm chín cùng với phần sa lát được biến tấu theo từng quốc gia có thể là cà chua, rau xà lách…..Bánh thường được ăn kèm cùng với khoai tây chiên và đồ uống có ga.\n\nTên gọi hamburger được đặt cho loại bánh này do bánh đã phát triển mạnh nhất và rất được ưa chuộng tại Hamburg của Đức. Chính vì vậy tên gọi hamburger được ra đời.', 32000, b'1'),
(19, b'1', '2024-08-23 07:59:54.000000', 'Đùi gà là phần thịt được nhiều người ưa thích, chắc thịt và thơm ngon hơn ức gà nhờ có lượng chất béo cao hơn.', b'0', b'0', 'Đùi gà rán', 37000, 2, 1, b'0', b'0', b'0', 5, 'Đùi Gà Rán Xuyên Việt Size Lớn được chọn lọc kỹ càng từ những chiếc đùi gà tươi ngon nhất, có trọng lượng trên 120 Gram. Sau đó, sản phẩm sẽ qua các quy trình làm sạch, chế biến và tẩm ướp bằng bột chiên độc quyền tại Gà Rán Xuyên Việt. Đảm bảo mang lại cho Quý Khách những miếng đùi gà giòn rụm, nóng hổi tươi ngon.\n\nVới tiêu chí luôn đặt sức khỏe của người tiêu dùng lên hàng đầu, nên khi mua hàng tại Gà Rán Xuyên Việt, Quý Khách Hàng luôn yên tâm bởi tại đây luôn chiên rán bằng dầu đậu nành nguyên chất. Cũng như sử dụng những gói tương cà, tương ớt chính hãng được gia công riêng. Hứa hẹn sẽ làm hài lòng kể cả những khách hàng khó tính nhất.', 17000, b'0'),
(20, b'1', '2024-08-23 08:01:18.000000', 'Pizza là loại bánh có hình tròn được nướng lên với 3 thành phần chính là đế bánh, nhân bánh và phô mai phủ.', b'1', b'1', 'Pizza ', 70000, 2, 1, b'0', b'0', b'1', 2, 'Bột pizza sau khi đã ủ theo tiêu chuẩn sẽ được nặn thành đế bánh theo kích thước 7”, 9” hoặc 12” (tương đương size S, M, L) với bột bắp.\nPhủ đều xốt cà chua lên trên mặt bánh, tiếp theo phủ 1 lớp phô mai Mozzarella lên trên.\nRải đều topping gồm xúc xích Ý, dăm bông, bò viên, ớt chuông, nấm mỡ, hành tây và trái ô-liu lên bề mặt bánh.\nPhủ phô mai Mozzarella lần 2 lên trên mặt bánh.\nNướng bánh qua lò ở nhiệt độ 240 độ C trong 5.5 phút. \nSau khi bánh chín, bạn cắt bánh thành từng miếng và thưởng thức.', 35000, b'0'),
(21, b'1', '2024-08-23 08:02:18.000000', 'Bánh cuốn là món ăn truyền thống Việt Nam với lớp vỏ mỏng làm từ bột gạo hấp chín, cuộn với nhân thịt heo xay, nấm hương và hành tím.', b'0', b'1', 'Bánh cuốn', 20000, 2, 1, b'1', b'1', b'0', 1, 'Bánh cuốn Nam Định với phần bánh được tráng khá kì công, bánh mỏng, dẻo, dai mặc dù không có nhân thịt nhưng bánh vẫn thơm cái vị của phần bột và không hề bị ngấy khi ăn. Để làm bánh, nước cần được đun sôi 100 độ C. Khi lấy bánh ra thì thoa một lớp mỡ hành mỏng và mộc nhĩ (nấm mèo) băm nhỏ cho bóng bẩy và đẹp mắt.', NULL, b'0');

-- --------------------------------------------------------

--
-- Table structure for table `food_images`
--

CREATE TABLE `food_images` (
  `food_id` bigint(20) NOT NULL,
  `images` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_images`
--

INSERT INTO `food_images` (`food_id`, `images`) VALUES
(1, 'http://res.cloudinary.com/dcpesbd8q/image/upload/v1722338071/q36hpi1oyoi79sbyaslf.jpg'),
(1, 'http://res.cloudinary.com/dcpesbd8q/image/upload/v1722338075/brm1u7kftlwvohq9ehcy.jpg'),
(1, 'http://res.cloudinary.com/dcpesbd8q/image/upload/v1722338081/bncfic1rlukzv8vv5knr.jpg'),
(2, 'http://res.cloudinary.com/dcpesbd8q/image/upload/v1722359438/c9dfcsmupelflwpublop.jpg'),
(2, 'http://res.cloudinary.com/dcpesbd8q/image/upload/v1722359444/d8lpkxsbbsf2he2ufat5.jpg'),
(17, 'http://res.cloudinary.com/dcpesbd8q/image/upload/v1724374514/eqhelj6cw9hmv9hck7kc.jpg'),
(17, 'http://res.cloudinary.com/dcpesbd8q/image/upload/v1724374522/eod7oy1yk9r5ssklszm8.png'),
(18, 'http://res.cloudinary.com/dcpesbd8q/image/upload/v1724374606/wt9l0b4dhp5bxrz8b44x.jpg'),
(18, 'http://res.cloudinary.com/dcpesbd8q/image/upload/v1724374611/uazwonu5w5xcgddsllk8.jpg'),
(18, 'http://res.cloudinary.com/dcpesbd8q/image/upload/v1724374625/qt0okrlmom8stffa0gnb.png'),
(18, 'http://res.cloudinary.com/dcpesbd8q/image/upload/v1724374640/wsq1ggqmk1tlnkfkxcro.jpg'),
(19, 'http://res.cloudinary.com/dcpesbd8q/image/upload/v1724374721/m3t06a5hxsdifcwnhi5k.jpg'),
(20, 'http://res.cloudinary.com/dcpesbd8q/image/upload/v1724374810/dhw9qpug7rvfrqmruyug.jpg'),
(20, 'http://res.cloudinary.com/dcpesbd8q/image/upload/v1724374814/xtma4ebiaiaft2wzfop8.jpg'),
(20, 'http://res.cloudinary.com/dcpesbd8q/image/upload/v1724374824/untgd4kxzq8qljxxqkjz.jpg'),
(6, 'https://congluan-cdn.congluan.vn/files/content/2021/08/28/dung-thu-3-the-gioi-ve-luong-tieu-thu-vi-sao-nguoi-viet-yeu-thich-mi-an-lien-100150455.jpg'),
(6, 'https://tttctt.1cdn.vn/thumbs/1200x630/2023/09/26/mitom.jpg'),
(6, 'https://vienydhdt.gov.vn/wp-content/uploads/2019/11/vienydhdt_migoi1.jpg'),
(7, 'https://i.vietgiaitri.com/2020/4/1/xuc-xich-duc-viet-thay-doi-nhan-dien-thuong-hieu-dong-xuc-xich-cao-cap-2b4-4810168.jpg'),
(7, 'https://imgcdn.tapchicongthuong.vn/tcct-media/20/4/1/img-8692.jpg'),
(21, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQBzQp3-gCUHUBVhg2vJYOpQ2bAZIiX8es8-VGUa2rB6XYvKXFbMkf35SDgDpQN95v9_7k&usqp=CAU'),
(21, 'https://giadinh.mediacdn.vn/k:thumb_w/640/2016/2-xac-5-mon-an-nhanh-duoc-ua-chuong-nhat-the-gioi-f413cea463-1453298322811/diem-danh-5-mon-an-nhanh-ai-cung-nem-it-nhat-1-lan.jpg'),
(21, 'https://datviettour.com.vn/uploads/images/tin-tuc/cam-nang-du-lich/du-lich-my/hamburger.jpg'),
(8, 'https://lamvugroup.vn/UPLOAD_FILES/Summernote/HomePage/2021/12/d5f822e8-8e3d-4324-af00-f0dd89ab537c.jfif'),
(8, 'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRV1D4a5QjlZiyzTrPMFf3bsjMFgi9Ot4Z8i5Uri5bZylpbRvKqQqNUas5cZu1uqxKHHk8&usqp=CAU'),
(8, 'https://www.pizzaexpress.vn/wp-content/uploads/2020/12/131119797_1757619101061116_7500252208487225091_o.jpg'),
(9, 'https://www.cet.edu.vn/wp-content/uploads/2018/08/thuc-an-nhanh.jpg'),
(9, 'https://i0.wp.com/www.helpingwildlife.org/wp/wp-content/uploads/2014/12/Vegan_Spaghetti_Bolognese_Recipe_001.jpg'),
(6, 'https://bizweb.dktcdn.net/thumb/large/100/337/144/products/xx.jpg?v=1575007398030'),
(7, 'https://maythucphamviet.vn/wp-content/uploads/2018/10/san-pham-may-nuong-xuc-xich-7-thanh.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `food_ingredients`
--

CREATE TABLE `food_ingredients` (
  `food_id` bigint(20) NOT NULL,
  `ingredients_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_ingredients`
--

INSERT INTO `food_ingredients` (`food_id`, `ingredients_id`) VALUES
(1, 1),
(2, 1),
(17, 2),
(17, 4),
(18, 1),
(18, 2),
(18, 3),
(19, 2),
(19, 4),
(19, 3),
(20, 2),
(20, 4);

-- --------------------------------------------------------

--
-- Table structure for table `food_ratings`
--

CREATE TABLE `food_ratings` (
  `food_id` bigint(20) NOT NULL,
  `rating` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_item`
--

CREATE TABLE `ingredients_item` (
  `id` bigint(20) NOT NULL,
  `in_stoke` bit(1) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `category_id` bigint(20) DEFAULT NULL,
  `restaurant_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients_item`
--

INSERT INTO `ingredients_item` (`id`, `in_stoke`, `name`, `category_id`, `restaurant_id`) VALUES
(1, b'1', 'white foood', 1, 1),
(2, b'1', 'thức ăn đen', 1, 1),
(3, b'1', 'Bột mì đa dụng', 1, 1),
(4, b'1', 'Muối biển', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `ingredients_item_seq`
--

CREATE TABLE `ingredients_item_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredients_item_seq`
--

INSERT INTO `ingredients_item_seq` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_category`
--

CREATE TABLE `ingredient_category` (
  `id` bigint(20) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `restaurant_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredient_category`
--

INSERT INTO `ingredient_category` (`id`, `name`, `restaurant_id`) VALUES
(1, 'bread', 1),
(2, 'Bánh bao', 1),
(3, 'Báng lăng', 1);

-- --------------------------------------------------------

--
-- Table structure for table `ingredient_category_seq`
--

CREATE TABLE `ingredient_category_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `ingredient_category_seq`
--

INSERT INTO `ingredient_category_seq` (`next_val`) VALUES
(101);

-- --------------------------------------------------------

--
-- Table structure for table `notification`
--

CREATE TABLE `notification` (
  `id` bigint(20) NOT NULL,
  `message` varchar(255) DEFAULT NULL,
  `read_status` bit(1) NOT NULL,
  `sent_at` datetime(6) DEFAULT NULL,
  `recipient_id` bigint(20) DEFAULT NULL,
  `restaurant_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notification`
--

INSERT INTO `notification` (`id`, `message`, `read_status`, `sent_at`, `recipient_id`, `restaurant_id`) VALUES
(1, 'your order is PENDING order id is - 1', b'0', '2024-07-30 18:45:24.000000', 2, NULL),
(2, 'your order is COMPLETED order id is - 1', b'0', '2024-07-30 18:45:26.000000', 2, NULL),
(3, 'your order is OUT_FOR_DELIVERY order id is - 1', b'0', '2024-07-30 18:45:28.000000', 2, NULL),
(4, 'your order is PENDING order id is - 1', b'0', '2024-07-30 18:45:29.000000', 2, NULL),
(5, 'your order is DELIVERED order id is - 1', b'0', '2024-07-30 18:56:44.000000', 2, NULL),
(6, 'your order is OUT_FOR_DELIVERY order id is - 1', b'0', '2024-07-30 18:56:55.000000', 2, NULL),
(7, 'your order is DELIVERED order id is - 1', b'0', '2024-07-30 18:56:56.000000', 2, NULL),
(8, 'your order is COMPLETED order id is - 4', b'0', '2024-07-30 19:19:42.000000', 1, NULL),
(9, 'your order is DELIVERED order id is - 1', b'0', '2024-07-30 21:21:11.000000', 2, NULL),
(10, 'your order is PENDING order id is - 1', b'0', '2024-07-30 21:21:13.000000', 2, NULL),
(11, 'your order is DELIVERED order id is - 13', b'0', '2024-07-31 00:07:29.000000', 1, NULL),
(12, 'your order is DELIVERED order id is - 12', b'0', '2024-07-31 00:07:31.000000', 1, NULL),
(13, 'your order is DELIVERED order id is - 1', b'0', '2024-07-31 12:55:51.000000', 2, NULL),
(14, 'your order is DELIVERED order id is - 1', b'0', '2024-07-31 14:07:56.000000', 2, NULL),
(15, 'your order is DELIVERED order id is - 1', b'0', '2024-07-31 15:13:04.000000', 2, NULL),
(16, 'your order is DELIVERED order id is - 1', b'0', '2024-08-13 12:53:04.000000', 2, NULL),
(17, 'your order is PENDING order id is - 1', b'0', '2024-08-13 12:53:07.000000', 2, NULL),
(18, 'your order is DELIVERED order id is - 18', b'0', '2024-08-13 14:25:59.000000', 1, NULL),
(19, 'your order is DELIVERED order id is - 1', b'0', '2024-08-14 09:50:34.000000', 2, NULL),
(20, 'your order is OUT_FOR_DELIVERY order id is - 2', b'0', '2024-08-14 09:50:37.000000', 2, NULL),
(21, 'your order is PENDING order id is - 2', b'0', '2024-08-14 09:50:40.000000', 2, NULL),
(22, 'your order is DELIVERED order id is - 56', b'0', '2024-08-16 13:25:13.000000', 2, NULL),
(23, 'your order is DELIVERED order id is - 60', b'0', '2024-08-16 13:25:29.000000', 2, NULL),
(24, 'your order is DELIVERED order id is - 71', b'0', '2024-08-18 11:25:51.000000', 2, NULL),
(25, 'your order is DELIVERED order id is - 1', b'0', '2024-09-01 13:33:59.000000', 2, NULL),
(26, 'your order is PENDING order id is - 1', b'0', '2024-09-01 13:34:01.000000', 2, NULL),
(27, 'your order is OUT_FOR_DELIVERY order id is - 1', b'0', '2024-09-01 13:34:03.000000', 2, NULL),
(28, 'your order is DELIVERED order id is - 71', b'0', '2024-09-02 09:26:57.000000', 2, NULL),
(29, 'your order is PENDING order id is - 71', b'0', '2024-09-02 09:27:00.000000', 2, NULL),
(30, 'your order is OUT_FOR_DELIVERY order id is - 71', b'0', '2024-09-02 09:27:03.000000', 2, NULL),
(31, 'your order is OUT_FOR_DELIVERY order id is - 1', b'0', '2024-09-02 09:27:48.000000', 2, NULL),
(32, 'your order is COMPLETED order id is - 1', b'0', '2024-09-02 09:27:51.000000', 2, NULL),
(33, 'your order is OUT_FOR_DELIVERY order id is - 1', b'0', '2024-09-02 09:47:19.000000', 2, NULL),
(34, 'your order is DELIVERED order id is - 1', b'0', '2024-09-02 09:47:22.000000', 2, NULL),
(35, 'your order is PENDING order id is - 2', b'0', '2024-09-02 17:50:14.000000', 2, NULL),
(36, 'your order is DELIVERED order id is - 2', b'0', '2024-09-02 17:50:17.000000', 2, NULL),
(37, 'your order is OUT_FOR_DELIVERY order id is - 3', b'0', '2024-09-02 17:51:17.000000', 2, NULL),
(38, 'your order is OUT_FOR_DELIVERY order id is - 2', b'0', '2024-09-02 17:52:23.000000', 2, NULL),
(39, 'your order is PENDING order id is - 2', b'0', '2024-09-02 17:52:27.000000', 2, NULL),
(40, 'your order is DELIVERED order id is - 2', b'0', '2024-09-02 17:52:30.000000', 2, NULL),
(41, 'your order is DELIVERED order id is - 2', b'0', '2024-09-02 17:52:39.000000', 2, NULL),
(42, 'your order is OUT_FOR_DELIVERY order id is - 2', b'0', '2024-09-02 17:52:43.000000', 2, NULL),
(43, 'your order is DELIVERED order id is - 2', b'0', '2024-09-02 17:52:48.000000', 2, NULL),
(44, 'your order is DELIVERED order id is - 1', b'0', '2024-09-02 17:54:33.000000', 2, NULL),
(45, 'your order is OUT_FOR_DELIVERY order id is - 1', b'0', '2024-09-02 17:54:37.000000', 2, NULL),
(46, 'your order is OUT_FOR_DELIVERY order id is - 1', b'0', '2024-09-02 18:17:23.000000', 2, NULL),
(47, 'your order is DELIVERED order id is - 1', b'0', '2024-09-02 18:17:26.000000', 2, NULL),
(48, 'your order is DELIVERED order id is - 8', b'0', '2024-09-03 01:06:08.000000', 1, NULL),
(49, 'your order is PENDING order id is - 8', b'0', '2024-09-03 01:06:10.000000', 1, NULL),
(50, 'your order is OUT_FOR_DELIVERY order id is - 1', b'0', '2024-09-03 12:32:39.000000', 2, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `order_status` varchar(255) DEFAULT NULL,
  `total_amount` bigint(20) DEFAULT NULL,
  `total_item` int(11) NOT NULL,
  `total_price` int(11) NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `delivery_address_id` bigint(20) DEFAULT NULL,
  `payment_id` bigint(20) DEFAULT NULL,
  `restaurant_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `order_status`, `total_amount`, `total_item`, `total_price`, `customer_id`, `delivery_address_id`, `payment_id`, `restaurant_id`) VALUES
(1, '2024-07-30 18:22:49.000000', 'OUT_FOR_DELIVERY', 861, 0, 0, 2, 2, NULL, 1),
(2, '2024-07-30 18:29:41.000000', 'DELIVERED', 123, 0, 0, 2, 3, NULL, 1),
(3, '2024-07-30 18:29:44.000000', 'OUT_FOR_DELIVERY', 123, 0, 0, 2, 4, NULL, 1),
(4, '2024-07-30 18:55:18.000000', 'COMPLETED', 369, 0, 0, 1, 5, NULL, 1),
(5, '2024-07-30 23:04:55.000000', 'PENDING', 123, 0, 0, 1, 6, NULL, 1),
(6, '2024-07-30 23:07:24.000000', 'PENDING', 123, 0, 0, 1, 7, NULL, 1),
(7, '2024-07-30 23:10:03.000000', 'PENDING', 615, 0, 0, 1, 8, NULL, 1),
(8, '2024-07-30 23:14:02.000000', 'PENDING', 615, 0, 0, 1, 9, NULL, 1),
(9, '2024-07-30 23:15:19.000000', 'PENDING', 615, 0, 0, 1, 10, NULL, 1),
(10, '2024-07-30 23:19:46.000000', 'PENDING', 615, 0, 0, 1, 11, NULL, 1),
(11, '2024-07-30 23:26:45.000000', 'PENDING', 615, 0, 0, 1, 12, NULL, 1),
(12, '2024-07-30 23:34:46.000000', 'DELIVERED', 615, 0, 0, 1, 13, NULL, 1),
(13, '2024-07-30 23:36:19.000000', 'DELIVERED', 123, 0, 0, 1, 14, NULL, 1),
(14, '2024-07-31 14:08:57.000000', 'PENDING', 123, 0, 0, 1, 16, NULL, 1),
(15, '2024-08-03 21:52:37.000000', 'PENDING', 369, 0, 0, 1, 17, NULL, 1),
(16, '2024-08-09 16:02:51.000000', 'PENDING', 369, 0, 0, 1, 18, NULL, 1),
(17, '2024-08-12 10:06:18.000000', 'PENDING', 135000, 0, 0, 2, 19, NULL, 1),
(18, '2024-08-13 13:46:18.000000', 'DELIVERED', 15000, 0, 0, 1, 20, NULL, 1),
(19, '2024-08-14 14:03:14.000000', 'PENDING', 175000, 0, 0, 2, 21, NULL, 1),
(20, '2024-08-15 08:49:31.000000', 'PENDING', 150000, 0, 0, 2, 22, NULL, 1),
(21, '2024-08-15 10:36:05.000000', 'PENDING', 10000, 0, 0, 1, 23, NULL, 1),
(22, '2024-08-15 10:50:34.000000', 'PENDING', 10000, 0, 0, 1, 24, NULL, 1),
(23, '2024-08-15 10:50:44.000000', 'PENDING', 10000, 0, 0, 1, 25, NULL, 1),
(24, '2024-08-15 10:51:01.000000', 'PENDING', 10000, 0, 0, 1, 26, NULL, 1),
(25, '2024-08-15 10:58:37.000000', 'PENDING', 10000, 0, 0, 1, 27, NULL, 1),
(26, '2024-08-15 11:09:33.000000', 'PENDING', 10000, 0, 0, 1, 28, NULL, 1),
(27, '2024-08-15 11:10:30.000000', 'PENDING', 10000, 0, 0, 1, 29, NULL, 1),
(28, '2024-08-15 11:16:02.000000', 'PENDING', 60000, 0, 0, 1, 30, NULL, 1),
(29, '2024-08-15 11:17:41.000000', 'PENDING', 60000, 0, 0, 1, 31, NULL, 1),
(30, '2024-08-15 11:20:14.000000', 'PENDING', 60000, 0, 0, 1, 32, NULL, 1),
(31, '2024-08-15 11:21:11.000000', 'PENDING', 60000, 0, 0, 1, 33, NULL, 1),
(32, '2024-08-15 11:27:42.000000', 'PENDING', 60000, 0, 0, 1, 34, NULL, 1),
(33, '2024-08-15 11:27:47.000000', 'PENDING', 60000, 0, 0, 1, 35, NULL, 1),
(34, '2024-08-15 11:28:03.000000', 'PENDING', 60000, 0, 0, 1, 36, NULL, 1),
(35, '2024-08-15 11:28:50.000000', 'PENDING', 60000, 0, 0, 1, 37, NULL, 1),
(36, '2024-08-15 11:28:57.000000', 'PENDING', 60000, 0, 0, 1, 38, NULL, 1),
(37, '2024-08-15 11:35:17.000000', 'PENDING', 60000, 0, 0, 1, 39, NULL, 1),
(38, '2024-08-15 12:00:38.000000', 'PENDING', 70000, 0, 0, 1, 40, NULL, 1),
(39, '2024-08-15 12:01:48.000000', 'PENDING', 15000, 0, 0, 1, 41, NULL, 1),
(40, '2024-08-15 12:17:04.000000', 'PENDING', 15000, 0, 0, 1, 42, NULL, 1),
(41, '2024-08-15 12:17:04.000000', 'PENDING', 15000, 0, 0, 1, 43, NULL, 1),
(42, '2024-08-15 12:17:04.000000', 'PENDING', 15000, 0, 0, 1, 44, NULL, 1),
(43, '2024-08-15 12:17:05.000000', 'PENDING', 15000, 0, 0, 1, 45, NULL, 1),
(44, '2024-08-15 12:17:05.000000', 'PENDING', 15000, 0, 0, 1, 46, NULL, 1),
(45, '2024-08-16 10:08:10.000000', 'PENDING', 30000, 0, 0, 2, 47, NULL, 1),
(46, '2024-08-16 10:10:02.000000', 'PENDING', 30000, 0, 0, 2, 48, NULL, 1),
(47, '2024-08-16 10:13:51.000000', 'PENDING', 30000, 0, 0, 2, 49, NULL, 1),
(48, '2024-08-16 10:13:58.000000', 'PENDING', 30000, 0, 0, 2, 50, NULL, 1),
(49, '2024-08-16 10:16:05.000000', 'PENDING', 30000, 0, 0, 2, 51, NULL, 1),
(50, '2024-08-16 10:17:13.000000', 'PENDING', 30000, 0, 0, 2, 52, NULL, 1),
(51, '2024-08-16 10:17:55.000000', 'PENDING', 30000, 0, 0, 2, 53, NULL, 1),
(52, '2024-08-16 10:26:23.000000', 'PENDING', 12000, 0, 0, 2, 54, NULL, 1),
(53, '2024-08-16 10:30:09.000000', 'PENDING', 12000, 0, 0, 2, 55, NULL, 1),
(54, '2024-08-16 10:44:24.000000', 'PENDING', 12000, 0, 0, 2, 56, NULL, 1),
(55, '2024-08-16 12:44:24.000000', 'PENDING', 10000, 0, 0, 2, 57, NULL, 1),
(56, '2024-08-16 12:50:26.000000', 'DELIVERED', 50000, 0, 0, 2, 58, NULL, 1),
(57, '2024-08-16 12:54:17.000000', 'PENDING', 10000, 0, 0, 2, 59, NULL, 1),
(58, '2024-08-16 12:57:29.000000', 'PENDING', 10000, 0, 0, 2, 60, NULL, 1),
(59, '2024-08-16 12:58:51.000000', 'PENDING', 10000, 0, 0, 2, 61, NULL, 1),
(60, '2024-08-16 12:59:01.000000', 'DELIVERED', 10000, 0, 0, 2, 62, NULL, 1),
(61, '2024-08-17 11:52:53.000000', 'PENDING', 27000, 0, 0, 1, 63, NULL, 1),
(62, '2024-08-17 12:00:42.000000', 'PENDING', 22000, 0, 0, 2, 64, NULL, 1),
(63, '2024-08-17 12:18:37.000000', 'PENDING', 22000, 0, 0, 2, 65, NULL, 1),
(64, '2024-08-18 08:38:29.000000', 'PENDING', 122000, 0, 0, 2, 66, NULL, 1),
(65, '2024-08-18 09:55:36.000000', 'PENDING', 22000, 0, 0, 2, 67, NULL, 1),
(66, '2024-08-18 10:01:41.000000', 'PENDING', 22000, 0, 0, 2, 68, NULL, 1),
(67, '2024-08-18 10:08:14.000000', 'PENDING', 22000, 0, 0, 2, 69, NULL, 1),
(68, '2024-08-18 10:11:09.000000', 'PENDING', 22000, 0, 0, 2, 70, NULL, 1),
(69, '2024-08-18 10:21:42.000000', 'PENDING', 22000, 0, 0, 2, 71, NULL, 1),
(70, '2024-08-18 10:35:47.000000', 'PENDING', 22000, 0, 0, 2, 72, NULL, 1),
(71, '2024-08-18 10:37:17.000000', 'OUT_FOR_DELIVERY', 22000, 0, 0, 2, 73, NULL, 1),
(72, '2024-08-23 10:34:55.000000', 'PENDING', 39000, 0, 0, 1, 74, NULL, 1),
(73, '2024-08-23 10:34:58.000000', 'PENDING', 39000, 0, 0, 1, 75, NULL, 1),
(74, '2024-08-30 10:36:53.000000', 'PENDING', 27000, 0, 0, 1, 76, NULL, 1),
(75, '2024-09-04 00:41:00.000000', 'PENDING', 70000, 0, 0, 1, 77, NULL, 1),
(76, '2024-09-04 00:46:21.000000', 'PENDING', 70000, 0, 0, 1, 78, NULL, 1),
(77, '2024-09-04 09:23:17.000000', 'PENDING', 210000, 0, 0, 1, 79, NULL, 1),
(78, '2024-09-04 09:27:15.000000', 'PENDING', 12000, 0, 0, 1, 80, NULL, 1),
(79, '2024-09-04 10:04:38.000000', 'PENDING', 102000, 0, 0, 1, 81, NULL, 1),
(80, '2024-09-04 10:05:18.000000', 'PENDING', 102000, 0, 0, 1, 82, NULL, 1),
(81, '2024-09-04 11:07:35.000000', 'PENDING', 118000, 0, 0, 1, 83, NULL, 1),
(82, '2024-09-04 11:13:47.000000', 'PENDING', 118000, 0, 0, 1, 84, NULL, 1),
(83, '2024-09-04 11:38:04.000000', 'PENDING', 118000, 0, 0, 1, 85, NULL, 1),
(84, '2024-09-04 12:21:10.000000', 'PENDING', 118000, 0, 0, 1, 86, NULL, 1),
(85, '2024-09-04 12:52:06.000000', 'PENDING', 118000, 0, 0, 1, 87, NULL, 1),
(86, '2024-09-05 13:44:25.000000', 'PENDING', 150000, 0, 0, 2, 88, NULL, 1),
(87, '2024-09-05 13:51:12.000000', 'PENDING', 60000, 0, 0, 1, 89, NULL, 1),
(88, '2024-09-05 13:53:10.000000', 'PENDING', 15000, 0, 0, 1, 90, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `orders_items`
--

CREATE TABLE `orders_items` (
  `order_id` bigint(20) NOT NULL,
  `items_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders_items`
--

INSERT INTO `orders_items` (`order_id`, `items_id`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16),
(17, 17),
(17, 18),
(17, 19),
(17, 20),
(19, 23),
(19, 24),
(20, 25),
(20, 26),
(21, 27),
(22, 28),
(23, 29),
(24, 30),
(25, 31),
(26, 32),
(27, 33),
(28, 34),
(28, 35),
(29, 36),
(29, 37),
(30, 38),
(30, 39),
(31, 40),
(31, 41),
(32, 42),
(32, 43),
(33, 44),
(33, 45),
(34, 46),
(34, 47),
(35, 48),
(35, 49),
(36, 50),
(36, 51),
(37, 52),
(37, 53),
(38, 54),
(38, 55),
(39, 56),
(40, 57),
(41, 58),
(42, 59),
(43, 60),
(44, 61),
(45, 62),
(46, 63),
(47, 64),
(48, 65),
(49, 66),
(50, 67),
(51, 68),
(52, 69),
(53, 70),
(54, 71),
(55, 72),
(56, 73),
(57, 74),
(58, 75),
(59, 76),
(60, 77),
(61, 78),
(61, 79),
(62, 80),
(62, 81),
(63, 82),
(63, 83),
(64, 84),
(64, 85),
(65, 86),
(65, 87),
(66, 88),
(66, 89),
(67, 90),
(67, 91),
(68, 92),
(68, 93),
(69, 94),
(69, 95),
(70, 96),
(70, 97),
(71, 98),
(71, 99),
(72, 100),
(72, 101),
(73, 102),
(73, 103),
(74, 104),
(74, 105),
(75, 106),
(76, 107),
(77, 108),
(78, 109),
(79, 110),
(79, 111),
(79, 112),
(80, 113),
(80, 114),
(80, 115),
(81, 116),
(81, 117),
(82, 118),
(82, 119),
(83, 120),
(83, 121),
(84, 122),
(84, 123),
(85, 124),
(85, 125),
(86, 126),
(87, 127),
(88, 128);

-- --------------------------------------------------------

--
-- Table structure for table `order_item`
--

CREATE TABLE `order_item` (
  `id` bigint(20) NOT NULL,
  `ingredients` varbinary(255) DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `total_price` bigint(20) DEFAULT NULL,
  `food_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_item`
--

INSERT INTO `order_item` (`id`, `ingredients`, `quantity`, `total_price`, `food_id`) VALUES
(1, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 7, 861, 1),
(2, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000177040000000174000b776869746520666f6f6f6478, 1, 123, 1),
(3, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000177040000000174000b776869746520666f6f6f6478, 1, 123, 1),
(4, NULL, 3, 369, 1),
(5, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000177040000000174000b776869746520666f6f6f6478, 1, 123, 1),
(6, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000177040000000174000b776869746520666f6f6f6478, 1, 123, 1),
(7, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000177040000000174000b776869746520666f6f6f6478, 5, 615, 1),
(8, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000177040000000174000b776869746520666f6f6f6478, 5, 615, 1),
(9, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000177040000000174000b776869746520666f6f6f6478, 5, 615, 1),
(10, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000177040000000174000b776869746520666f6f6f6478, 5, 615, 1),
(11, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000177040000000174000b776869746520666f6f6f6478, 5, 615, 1),
(12, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000177040000000174000b776869746520666f6f6f6478, 5, 615, 1),
(13, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000177040000000174000b776869746520666f6f6f6478, 1, 123, 1),
(14, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000177040000000174000b776869746520666f6f6f6478, 1, 123, 1),
(15, NULL, 3, 369, 1),
(16, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 3, 369, 1),
(17, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 60000, 9),
(18, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 10000, 6),
(19, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 50000, 7),
(20, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 15000, 2),
(21, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 15000, 2),
(22, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 3, 150000, 7),
(23, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 10000, 6),
(24, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 15000, 2),
(25, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000277040000000274000f7468e1bba96320c4836e20c491656e74000b776869746520666f6f6f6478, 2, 120000, 8),
(26, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000177040000000174000b776869746520666f6f6f6478, 2, 30000, 2),
(27, NULL, 1, 10000, 6),
(28, NULL, 1, 10000, 6),
(29, NULL, 1, 10000, 6),
(30, NULL, 1, 10000, 6),
(31, NULL, 1, 10000, 6),
(32, NULL, 1, 10000, 6),
(33, NULL, 1, 10000, 6),
(34, NULL, 1, 10000, 6),
(35, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 50000, 7),
(36, NULL, 1, 10000, 6),
(37, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 50000, 7),
(38, NULL, 1, 10000, 6),
(39, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 50000, 7),
(40, NULL, 1, 10000, 6),
(41, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 50000, 7),
(42, NULL, 1, 10000, 6),
(43, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 50000, 7),
(44, NULL, 1, 10000, 6),
(45, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 50000, 7),
(46, NULL, 1, 10000, 6),
(47, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 50000, 7),
(48, NULL, 1, 10000, 6),
(49, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 50000, 7),
(50, NULL, 1, 10000, 6),
(51, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 50000, 7),
(52, NULL, 1, 10000, 6),
(53, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 50000, 7),
(54, NULL, 2, 20000, 6),
(55, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 50000, 7),
(56, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 15000, 2),
(57, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 15000, 2),
(58, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 15000, 2),
(59, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 15000, 2),
(60, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 15000, 2),
(61, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 15000, 2),
(62, NULL, 3, 30000, 6),
(63, NULL, 3, 30000, 6),
(64, NULL, 3, 30000, 6),
(65, NULL, 3, 30000, 6),
(66, NULL, 3, 30000, 6),
(67, NULL, 3, 30000, 6),
(68, NULL, 3, 30000, 6),
(69, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 12000, 1),
(70, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 12000, 1),
(71, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 12000, 1),
(72, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000177040000000174000f7468e1bba96320c4836e20c491656e78, 1, 10000, 6),
(73, NULL, 1, 50000, 7),
(74, NULL, 1, 10000, 6),
(75, NULL, 1, 10000, 6),
(76, NULL, 1, 10000, 6),
(77, NULL, 1, 10000, 6),
(78, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 15000, 2),
(79, NULL, 1, 12000, 1),
(80, NULL, 1, 10000, 6),
(81, NULL, 1, 12000, 1),
(82, NULL, 1, 10000, 6),
(83, NULL, 1, 12000, 1),
(84, NULL, 11, 110000, 6),
(85, NULL, 1, 12000, 1),
(86, NULL, 1, 10000, 6),
(87, NULL, 1, 12000, 1),
(88, NULL, 1, 10000, 6),
(89, NULL, 1, 12000, 1),
(90, NULL, 1, 10000, 6),
(91, NULL, 1, 12000, 1),
(92, NULL, 1, 10000, 6),
(93, NULL, 1, 12000, 1),
(94, NULL, 1, 10000, 6),
(95, NULL, 1, 12000, 1),
(96, NULL, 1, 10000, 6),
(97, NULL, 1, 12000, 1),
(98, NULL, 1, 10000, 6),
(99, NULL, 1, 12000, 1),
(100, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 15000, 2),
(101, NULL, 2, 24000, 1),
(102, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 15000, 2),
(103, NULL, 2, 24000, 1),
(104, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 12000, 1),
(105, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 15000, 2),
(106, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 70000, 20),
(107, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 70000, 20),
(108, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 3, 210000, 20),
(109, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 12000, 1),
(110, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 70000, 20),
(111, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 12000, 1),
(112, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 20000, 21),
(113, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 70000, 20),
(114, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 12000, 1),
(115, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 20000, 21),
(116, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 4, 48000, 1),
(117, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 70000, 20),
(118, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 4, 48000, 1),
(119, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 70000, 20),
(120, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 4, 48000, 1),
(121, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 70000, 20),
(122, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 4, 48000, 1),
(123, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 70000, 20),
(124, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 4, 48000, 1),
(125, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a6578700000000077040000000078, 1, 70000, 20),
(126, NULL, 10, 150000, 2),
(127, NULL, 4, 60000, 2),
(128, NULL, 1, 15000, 2);

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_token`
--

CREATE TABLE `password_reset_token` (
  `id` int(11) NOT NULL,
  `expiry_date` datetime(6) DEFAULT NULL,
  `token` varchar(255) DEFAULT NULL,
  `user_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `password_reset_token`
--

INSERT INTO `password_reset_token` (`id`, `expiry_date`, `token`, `user_id`) VALUES
(1, '2024-07-30 23:59:46.000000', '528e6080-0726-4f2b-a12b-71e91d911c77', 1),
(2, '2024-08-03 21:41:05.000000', 'c223f47c-5f60-473e-896f-fccb9aa7ad82', 1),
(7, '2024-08-03 22:23:19.000000', '437dcc74-861a-48dd-b700-03cabdd38141', 1),
(9, '2024-08-19 10:54:56.000000', '5c14a8c3-076f-434e-98cc-72ecbb035fdc', 1),
(10, '2024-09-01 12:03:17.000000', '6f969bd4-a2ef-49a2-8bc3-7be18876f219', 1),
(12, '2024-09-01 12:51:45.000000', 'a5c928b6-8806-4994-9a0a-4f58a8a12534', 1),
(13, '2024-09-01 12:55:08.000000', '45b5f815-56a0-40fd-aeb1-76a1bd7e606b', 1),
(14, '2024-09-01 12:59:18.000000', 'd0a766ff-1d63-4a54-a035-2d7d7489a3af', 1),
(15, '2024-09-01 13:04:12.000000', 'a8b2d32c-8379-4ab9-8c3b-3eaae66b4bab', 1),
(16, '2024-09-01 13:09:19.000000', '6ba4ebbb-f677-4901-8353-8cdf71d2aef3', 1),
(17, '2024-09-01 13:16:14.000000', '7a6d8a67-017e-4898-b5d2-5fed0071e5fe', 1),
(18, '2024-09-01 13:21:18.000000', '83401e0c-896e-49e1-98c4-04a807ccf426', 1),
(19, '2024-09-01 13:23:54.000000', '111bbafa-6430-4e79-b980-6a9f7ed3b0d8', 1),
(20, '2024-09-01 13:25:00.000000', 'a6a3d03e-fc6f-42c8-a604-b31826455f22', 1),
(21, '2024-09-01 13:27:48.000000', 'a75a214a-26c6-4435-8ce4-7098ce96a015', 1),
(22, '2024-09-01 13:30:23.000000', '211de843-a06a-4f48-a544-4f4041fb6521', 1),
(23, '2024-09-01 13:33:12.000000', '1dc8d9c5-71bb-4784-b057-44bcb1f6b4e0', 1),
(24, '2024-09-01 13:35:48.000000', '40061837-4b8d-4821-867b-16db15d01e81', 1),
(25, '2024-09-01 13:38:41.000000', '86de82e3-4771-4bde-a380-d0fff994fafc', 1);

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `order_id` bigint(20) DEFAULT NULL,
  `payment_method` varchar(255) DEFAULT NULL,
  `payment_status` varchar(255) DEFAULT NULL,
  `total_amount` double NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `post`
--

CREATE TABLE `post` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `updated_at` datetime(6) DEFAULT NULL,
  `content` mediumtext DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `short_description` text DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `status` int(11) DEFAULT 0,
  `created_by` bigint(20) DEFAULT NULL,
  `updated_by` bigint(20) DEFAULT NULL,
  `is_new` bit(1) DEFAULT NULL,
  `posted_at` datetime(6) DEFAULT NULL,
  `topic_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `post`
--

INSERT INTO `post` (`id`, `created_at`, `updated_at`, `content`, `image`, `name`, `short_description`, `slug`, `status`, `created_by`, `updated_by`, `is_new`, `posted_at`, `topic_id`) VALUES
(2, '2024-08-22 11:31:58.000000', '2024-08-22 11:31:58.000000', '<div class=\"detail__cmain\" id=\"main-detail\">\n\n    <!-- Phần thông tin tiêu đề và ngày tháng -->\n    <div class=\"detail-top\">\n        <div class=\"detail-cate\">\n            <a href=\"/suc-khoe.htm\" title=\"Sức khỏe\">Sức khỏe</a>\n            <a href=\"/suc-khoe/biet-de-khoe.htm\" title=\"Biết để khỏe\">Biết để khỏe</a>\n        </div>\n        <div class=\"detail-time\">\n            <div data-role=\"publishdate\">\n                13/10/2017 15:13 GMT+7\n            </div>\n        </div>\n    </div>\n\n    <!-- Tiêu đề bài viết -->\n    <h1 class=\"detail-title article-title\" data-role=\"title\">Thức ăn nhanh - tiện nhưng không lợi</h1>\n    \n    <!-- Thông tin tác giả và hành động -->\n    <div class=\"detail-info\">\n        <div class=\"detail-author oneauthor\">\n            <div class=\"groupavtauthor\">\n                <span class=\"avata\">\n                    <img src=\"https://static-tuoitre.tuoitre.vn/tuoitre/web_images/author_default.png\" alt=\"Nguồn: Viện Dinh dưỡng Quốc gia\">\n                </span>\n            </div>\n            <div class=\"author-info\">\n                <span class=\"name\">Nguồn: Viện Dinh dưỡng Quốc gia</span>\n            </div>\n        </div>\n\n        <div class=\"detail-info-action\">\n            <div class=\"detail-player\">\n                <div class=\"embed-tts hidden\" data-newsid=\"20171013150146633\" data-distributiondate=\"2017/10/13\" data-namespace=\"tuoitre\"></div>\n            </div>\n            <div class=\"detail-follow-gg\">\n                <a title=\"news google\" href=\"https://news.google.com/publications/CAAqBwgKMKXAxAswyNvbAw?hl=vi&amp;gl=VN&amp;ceid=VN:vi\" target=\"_blank\" rel=\"nofollow\">\n                    <img alt=\"news google\" src=\"https://static-tuoitre.tuoitre.vn/tuoitre/web_images/banner_gg_news_v2.png\" width=\"182\" height=\"34\">\n                </a>\n            </div>\n        </div>\n    </div>\n\n    <!-- Mô tả ngắn gọn của bài viết -->\n    <h2 class=\"detail-sapo\" data-role=\"sapo\">\n        Nếu lạm dụng đồ ăn nhanh - fastfood sẽ không có lợi thậm chí còn có hại cho sức khỏe.\n    </h2>\n\n    <!-- Nội dung bài viết -->\n    <div data-check-position=\"body_start\"></div>\n    <div class=\"detail-content afcbc-body\" data-role=\"content\" itemprop=\"articleBody\">\n        <div class=\"VCSortableInPreviewMode noCaption\">\n            <!-- Hình ảnh và nội dung -->\n            <div>\n                <a href=\"//cdn.tuoitre.vn/2017/hinh-1-1507881616159.jpg\" data-fancybox=\"content\" target=\"_blank\">\n                    <img src=\"https://cdn.tuoitre.vn/thumb_w/730/2017/hinh-1-1507881616159.jpg\" alt=\"Thức ăn nhanh - tiện nhưng không lợi - Ảnh 1.\" title=\"Thức ăn nhanh - tiện nhưng không lợi - Ảnh 1.\" class=\"lightbox-content\">\n                </a>\n                <div class=\"PhotoCMS_Caption\">\n                    <p data-placeholder=\"[nhập chú thích]\" class=\"NLPlaceholderShow\"></p>\n                </div>\n            </div>\n            \n            <!-- Nội dung bài viết -->\n            <p>\n                <span style=\"color: rgb(60, 60, 60);\">Khách hàng của các cửa hàng fastfood này chủ yếu là các bạn thanh thiếu niên, khi đã ăn quen họ luôn có cảm giác thèm các loại thức ăn này, vì fastfood là những thức ăn không mất thời gian chế biến, tiện dụng, có thể vừa ăn vừa tán chuyện, hương vị khá ngon, màu sắc hấp dẫn, cộng thêm nhiều chương trình quảng cáo trẻ trung hết sức bắt mắt và những hình thức khuyến mại dễ hợp lòng người, đã níu chân nhiều bạn trẻ mỗi khi đi qua các cửa hàng này.</span>\n            </p>\n            <p>\n                Ăn đồ ăn nhanh đang là một xu hướng của giới trẻ tại các thành phố lớn, nhiều bạn trẻ cho rằng đây là phong cách ăn sành điệu, biểu hiện của lối sống hiện đại. Thế nhưng đồ ăn nhanh không chỉ mất cân đối về dinh dưỡng mà còn có thể có một số chất độc hại sinh ra trong quá trình chế biến ảnh hưởng tới sức khỏe.\n            </p>\n            <p>- Fastfood chứa nhiều calori và cholesterol nên khả năng gây béo phì cho những ai có xu hướng lạm dụng chúng là rất cao, muốn đốt bớt năng lượng dư thừa thì cần tăng cường hoạt động thể lực và tập thể dục thường xuyên nhưng khi sử dụng đồ ăn nhanh nhiều thì khiến con người trì trệ hơn (không phải đi chợ mua thực phẩm, chế biến, nấu nướng...). Các nghiên cứu y tế cho thấy việc dùng fastfood và nước ngọt có ga, soda... thường xuyên sẽ không tốt cho chức năng gan.</p>\n            <p>- Không chỉ cung cấp nhiều chất béo và cholesterol, nhiều loại thức ăn nhanh còn có chỉ số đường huyết cao (chỉ số chuyển hoá carbonhydrat thành glucose đưa vào máu), ví dụ như các loại bánh được làm từ bột mì trắng, khoai tây rán, các loại nước ngọt có ga (là những thành phần có trong khẩu phần của fastfood). Khi dùng các loại thức ăn nhanh trong thành phần có các loại thực phẩm trên sẽ làm lượng đường tăng trong máu nhanh và sẽ khiến tuyến tuỵ phải tiết nhiều Insulin để giúp chuyển hoá glucose thành năng lượng. Do tuyến tuỵ luôn phải hoạt động quá nhiều sẽ bị suy giảm chức năng và dẫn đến đái tháo đường typ 2. Bệnh này trước đây chỉ gặp ở người lớn nay đã gặp ở trẻ em mà những trẻ em mập có nguy cơ mắc cao hơn.</p>\n            <p>- Những loại thực phẩm công nghiệp như thịt nguội, xúc xích, thịt xông khói, lạp sườn, gà rán... là những thành phần sử dụng trong fastfood đều có chứa hàm lượng muối cao và chất bảo quản. Nếu sử dụng nhiều fastfood sẽ đưa vào cơ thể lượng muối và chất bảo quản cao dẫn đến có hại cho tim, thận làm tăng huyết áp động mạch.</p>\n            <p>- Một số món ăn nhanh hiện khá phổ biến là \"mì, bún, phở ăn liền\", thành phần dinh dưỡng của loại thức ăn liền này chủ yếu là chất bột còn chất đạm, chất béo, vitamin đều rất thấp. Những người thường xuyên ăn \"mì ăn liền\" trong thời gian dài có tới 60% bị mắc các chứng bệnh thiếu dinh dưỡng, trong đó thiếu máu do thiếu sắt là 54%, thiếu vitamin B2 là 23%, thiếu kẽm là 16% và thiếu vitamin A là 29%.</p>\n            <p>- Trong fastfood luôn chứa chất béo bão hoà Triglycerid (loại chất béo xấu), làm gia tăng cholesterol trong máu gây xơ vữa động mạch, tăng huyết áp và các bệnh về tim mạch.</p>\n            <p>- Các món ăn nhanh thường đơn giản không mang tính đa dạng thực phẩm. Theo lời khuyên của các chuyên gia dinh dưỡng, mỗi bữa ăn cần có đủ 4 nhóm thực phẩm (nhóm chất bột, nhóm chất đạm, nhóm chất béo, nhóm vitamin và muối khoáng) với 15 loại thực phẩm phối hợp khác nhau. Trong fastfood thường số lượng các loại thực phẩm ít và phải qua chế biến công nghiệp nên thiếu các thành phần vi lượng và khoáng chất. Do đó fastfood thường thiếu và mất cân đối về dinh dưỡng, chưa kể đến việc sử dụng các chất phụ gia trong tẩm ướp và các dụng cụ chứa đựng không đáp ứng tiêu chuẩn vệ sinh.</p>\n            <p>Thực ra các loại fastfood (thức ăn nhanh) rất phù hợp với cuộc sống khẩn trương. Nhưng cái đích của chúng ta là ăn sao cho ngon, cho tiện nhưng phải đảm bảo sức khoẻ, vẻ đẹp và phòng tránh được bệnh tật. Do vậy chỉ nên ăn fastfood khi thực sự bận rộn, thiếu thời gian, không nên ăn thường xuyên, kéo dài nhiều ngày. Các bữa ăn truyền thống với đa dạng thực phẩm tươi, sạch sẽ đem lại sự khoẻ mạnh, thân hình cân đối và phòng tránh được các bệnh liên quan đến ăn uống.</p>\n        </div>\n    </div>\n</div>\n', '1724301118239_chickenwings.png', 'Thức ăn nhanh - tiện nhưng không lợi', 'Nếu lạm dụng đồ ăn nhanh - fastfood sẽ không có lợi', 'bai-viet', 0, NULL, NULL, b'0', '2024-08-25 09:21:44.000000', 3),
(5, '2024-08-23 08:53:00.000000', '2024-08-23 08:53:00.000000', '<p>Những món đồ ăn nhanh như hamburger, pizza, gà rán, hotdog đã trở thành món ăn không thể thiếu trong cuộc sống hiện đại. Bài viết này sẽ giới thiệu top 10 món đồ ăn nhanh phổ biến nhất thế giới.</p>', '1.jpg', 'Top 10 món đồ ăn nhanh phổ biến nhất thế giới', 'Danh sách những món đồ ăn nhanh được yêu thích nhất trên thế giới.', 'top-10-mon-do-an-nhanh-pho-bien-nhat-the-gioi', 0, NULL, NULL, b'0', '2024-08-25 09:21:44.000000', 2),
(6, '2024-08-23 08:53:29.000000', '2024-08-23 08:53:29.000000', '<p>Với sự tiện lợi, hương vị hấp dẫn và giá cả phải chăng, đồ ăn nhanh trở thành lựa chọn yêu thích của nhiều người, đặc biệt là giới trẻ và những người bận rộn.</p>', '2.jpg', 'Tại sao đồ ăn nhanh lại thu hút nhiều người?', 'Đồ ăn nhanh rất phổ biến nhưng tại sao lại thu hút nhiều người đến vậy?', 'tai-sao-do-an-nhanh-lai-thu-hut-nhieu-nguoi', 0, NULL, NULL, b'0', '2024-08-25 09:21:44.000000', 3),
(7, '2024-08-23 08:56:34.000000', '2024-08-23 08:56:34.000000', '<p>Để giảm thiểu tác động xấu từ đồ ăn nhanh, bạn có thể chọn những món có hàm lượng calo thấp hơn, giảm số lần ăn trong tuần và kết hợp với tập luyện thường xuyên.</p>', '4.jpg', 'Làm thế nào để ăn đồ ăn nhanh một cách lành mạnh?', 'Ăn đồ ăn nhanh nhưng vẫn muốn duy trì sức khỏe? Đây là cách làm.', 'lam-the-nao-de-an-do-an-nhanh-mot-cach-lanh-manh', 0, NULL, NULL, b'0', '2024-08-25 09:21:44.000000', 2),
(8, '2024-08-24 21:39:08.000000', '2024-08-26 12:16:29.000000', '<!DOCTYPE html>\n<html lang=\"vi\">\n<head>\n    <meta charset=\"UTF-8\">\n    <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n    <title>Bài viết Blog</title>\n    <style>\n        body {\n            font-family: Arial, sans-serif;\n            line-height: 1.6;\n            margin: 0;\n            padding: 0;\n            background-color: #f4f4f4;\n        }\n\n        .container {\n            width: 80%;\n            margin: 20px auto;\n            background: #fff;\n            padding: 20px;\n            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);\n        }\n\n        .title-head {\n            font-size: 2em;\n            margin-bottom: 10px;\n        }\n\n        .postby {\n            color: #777;\n            margin-bottom: 20px;\n        }\n\n        .postby b {\n            color: #333;\n        }\n\n        .blog_related article {\n            margin-bottom: 15px;\n        }\n\n        .blog_entry-title {\n            font-size: 1.2em;\n            margin: 0;\n        }\n\n        .blog_entry-title a {\n            text-decoration: none;\n            color: #007BFF;\n        }\n\n        .blog_entry-title a:hover {\n            text-decoration: underline;\n        }\n\n        .article-details {\n            margin-top: 30px;\n        }\n\n        .article-content {\n            margin-bottom: 40px;\n        }\n\n        .article-content h2 {\n            margin-top: 20px;\n            font-size: 1.5em;\n            color: #333;\n        }\n\n        .article-content h3 {\n            margin-top: 15px;\n            font-size: 1.3em;\n            color: #555;\n        }\n\n        .article-content img {\n            max-width: 100%;\n            height: auto;\n            margin: 20px 0;\n        }\n\n        .rte p {\n            margin-bottom: 15px;\n            color: #333;\n        }\n\n        .rte p em {\n            color: #555;\n            font-style: italic;\n        }\n\n        .rte p strong {\n            color: #000;\n            font-weight: bold;\n        }\n    </style>\n</head>\n<body>\n    <div class=\"container\">\n        <h1 class=\"title-head\">[Bật mí] Thức ăn nhanh và những sự thật ít ai biết về món ăn nhanh</h1>\n        \n        <div class=\"postby\">\n            <span>Đăng bởi <b>thoai linh</b> vào lúc 30/07/2021</span>\n        </div>\n\n        <div class=\"blog_related\">\n            <article class=\"blog_entry\">\n                <h3 class=\"blog_entry-title\">\n                    <a href=\"/bien-doi-khi-hau-viet-nam\" title=\"Báo động biến đổi khí hậu Việt Nam và hậu quả khó lường\">\n                        <i class=\"ion ion-md-arrow-dropright\"></i> Báo động biến đổi khí hậu Việt Nam và hậu quả khó lường\n                    </a>\n                </h3>\n            </article>\n            <article class=\"blog_entry\">\n                <h3 class=\"blog_entry-title\">\n                    <a href=\"/do-uong-nong-cho-mua-dong\" title=\"Cách pha #9 đồ uống nóng cho mùa Đông không lạnh\">\n                        <i class=\"ion ion-md-arrow-dropright\"></i> Cách pha #9 đồ uống nóng cho mùa Đông không lạnh\n                    </a>\n                </h3>\n            </article>\n            <article class=\"blog_entry\">\n                <h3 class=\"blog_entry-title\">\n                    <a href=\"/cach-lam-bia-up-nguoc\" title=\"#7 cách làm bia úp ngược khiến giới trẻ “phát sốt”\">\n                        <i class=\"ion ion-md-arrow-dropright\"></i> #7 cách làm bia úp ngược khiến giới trẻ “phát sốt”\n                    </a>\n                </h3>\n            </article>\n            <article class=\"blog_entry\">\n                <h3 class=\"blog_entry-title\">\n                    <a href=\"/cach-lam-nuoc-trai-cay-co-gas\" title=\"Vừa ngon vừa khoẻ với cách làm nước trái cây có gas tự nhiên\">\n                        <i class=\"ion ion-md-arrow-dropright\"></i> Vừa ngon vừa khoẻ với cách làm nước trái cây có gas tự nhiên\n                    </a>\n                </h3>\n            </article>\n            <article class=\"blog_entry\">\n                <h3 class=\"blog_entry-title\">\n                    <a href=\"/cach-pha-ca-phe-sua-da\" title=\"Cách pha cà phê sữa đá thơm ngon có thể bạn chưa biết\">\n                        <i class=\"ion ion-md-arrow-dropright\"></i> Cách pha cà phê sữa đá thơm ngon có thể bạn chưa biết\n                    </a>\n                </h3>\n            </article>\n        </div>\n\n        <div class=\"article-details\">                        \n            <div class=\"article-content\">\n                <div class=\"rte\">\n                    <p><em>Tất bật với cuộc sống, chúng ta dường như bận rộn hơn. Không còn nhiều thời gian để nấu nướng, trong khi <strong>thức ăn nhanh</strong> giải quyết chiếc bụng đói trong phút mốt, trở thành món ăn của giới trẻ.</em></p>\n                    <p>Nhưng điều gì trong món ăn ấy thu hút mọi người đến thế? Liệu ăn nhiều thì lợi hay hại? Chúng ta đang đơn thuần xem nó như một loại thức ăn ngon, hấp dẫn, mà không hiểu rõ những mối nguy tiềm ẩn mà bản thân có thể gặp phải. Tôi tin rằng bạn không muốn thế, hiểu rõ thức ăn nhanh, sẽ giúp bạn có cuộc sống chất lượng hơn nhiều. Vì sao tôi lại nói thế? Hãy đọc ngay bài viết này.&nbsp;</p>\n                    <h2><strong>1. Thức ăn nhanh là gì</strong></h2>\n                    <p>Thức ăn nhanh là gì? Đây là&nbsp;từ dùng để chỉ loại thức ăn được nấu trong thời gian ngắn, phục vụ nhanh hoặc đã chế biến sẵn rồi hâm lại khi cần. Còn biết đến với tên gọi fastfood, thức ăn nhanh chuyên phục vụ hình thức bán mang đi, hoặc ăn tại chỗ trong thời gian ngắn.&nbsp;</p>\n                    <p>Văn hóa thức ăn nhanh phát triển từ những năm 90 ở châu Mỹ, về sau mở rộng mạnh ở châu Âu và châu Á.&nbsp;</p>\n                    <img src=\"//bizweb.dktcdn.net/100/339/225/files/thuc-an-nhanh.jpg?v=1627638748869\" alt=\"fastfood\">\n                    <p>Năm 1998, đồ ăn nhanh chính thức du nhập vào Việt Nam bởi thương hiệu Lotteria của Hàn Quốc. Từ đây, loại hình fastfood được đón nhận mạnh mẽ, đặc biệt là giới trẻ ở những thành phố lớn. Với lối sống trẻ trung, năng động, khiến fastfood ngày càng trở thành món ăn yêu thích tại Việt Nam.</p>\n                    <p>Bên cạnh sự tiện lợi, thì thức ăn nhanh thường nhỏ gọn, hình thức lại bắt mắt, mùi vị thơm ngon như hamburger, gà rán, pizza, sandwich,...chính là nguyên nhân khiến chúng có độ phủ sóng lớn trên thị trường.</p>\n                    <p>Ngay cả tôi cũng không ít lần ăn fastfood, và tôi tin bạn cũng thế. Tiếp theo, hãy cùng tôi điểm qua một vài thương hiệu fastfood nổi tiếng hiện nay.&nbsp;</p>\n                    <h2><strong>2. Các loại thức ăn nhanh</strong></h2>\n                    <p>Không ai có thể cưỡng lại độ ngon của đồ ăn nhanh. Nhất là các bạn trẻ. Dẫu ăn đi ăn lại nhiều lần, thì các loại đồ ăn nhanh như&nbsp;pizza, hamburger, gà rán, pizza, mỳ ý,...vẫn là món ăn yêu thích của nhiều người.</p>\n                    <p>Tại Việt Nam, rất nhiều cửa hàng phục vụ fastfood. Nhưng thương hiệu thức ăn nhanh quen thuộc mà ngay cả nhắm mắt cũng nghĩ ra chỉ có thể là:</p>\n                    <h3>a. Thương hiệu đồ ăn nhanh Lotteria</h3>\n                    <img src=\"//bizweb.dktcdn.net/100/339/225/files/lotteria.jpg?v=1627638766542\" alt=\"lotteria\">\n                    <p>Lotteria thương hiệu thức ăn nhanh bắt nguồn từ xứ sở kim chi, cho đến ngày nay thương hiệu này đã có hơn 210 chi nhánh trên toàn Việt Nam. Với món gà rán giòn tan, hamburger ngon miệng, cùng mức giá tầm trung dễ mua, đã thu hút lượng lớn khách hàng.&nbsp;</p>\n                    <h3>b. KFC</h3>\n                    <p>Ngoài Lotteria, KFC cũng là thương hiệu đồ ăn nhanh thân quen với mỗi người Việt. Món gà rán hương vị độc đáo hay bánh tart trứng thơm phức khiến giới trẻ yêu thích. Tại Việt Nam, hiện đã có hơn 100 cửa hàng KFC tại các thành phố lớn. Đi đến đâu cũng thấy hình ảnh KFC, cho thấy độ phủ sóng của thương hiệu này là lớn đến nhường nào.</p>\n                    <h3>c. Pizza Hut</h3>\n                    <p>Thèm pizza thì nên ăn ở đâu? Pizza Hut chứ còn đâu nữa. Bánh pizza với đủ loại hương vị, kèm phô mai béo ngậy, cắn một miếng là đã đời. Không chỉ món pizza, các món ăn kèm như mỳ ý, gà rán cũng ngon hết sẩy. Còn về độ uy tín, thì khỏi bàn, bởi Pizza Hut có mặt tại Việt Nam hơn 10 năm nay, được các bạn trẻ vô cùng yêu thích.</p>\n                    <h3>d. Jollibee</h3>\n                    <img src=\"//bizweb.dktcdn.net/100/339/225/files/jollibee.jpg?v=1627638779158\" alt=\"jollibee\">\n                    <p>Thương hiệu cuối cùng mà tôi muốn nhắc đến chính là Jollibee, một trong những cửa hàng đồ ăn nhanh có xuất xứ từ Philippines. Với tiêu chí rẻ, chất lượng, nhanh chóng, hiện đã có hơn 100 cửa hàng Jollibee tại Việt Nam. Chinh phục giới trẻ bằng món mì ý, gà rán với vị ngon đặc biệt.</p>\n                    <p>Các thương hiệu này hiện vẫn đang không ngừng phát triển và chiếm lĩnh thị trường đồ ăn nhanh tại Việt Nam. Nhưng cũng có nhiều ý kiến cho rằng ăn nhiều đồ ăn nhanh sẽ không tốt cho sức khỏe. Điều này là đúng. Bởi lợi và hại, luôn song hành với nhau.</p>\n                    <h2><strong>3. Lợi ích của thức ăn nhanh</strong></h2>\n                    <p>Nói đến lợi ích của thức ăn nhanh, điều đầu tiên tôi nghĩ đến là tiết kiệm thời gian. Chẳng hạn buổi sáng vội đi làm, chỉ mất 2 phút là bạn đã có ngay một chiếc hamburger cùng ly sữa uống mang đi.</p>\n                    <p>Vào dịp tụ tập bạn bè cũng vậy, đồ ăn nhanh luôn là lựa chọn số một. Không cần chờ đợi lâu, lại dễ dàng tìm thấy. Các loại đồ ăn nhanh thường có mức giá hợp lý, cùng với đó là rất nhiều chương trình ưu đãi hấp dẫn.</p>\n                    <p>Đặc biệt, các món ăn nhanh hiện nay cũng đã đa dạng hơn, thêm nhiều lựa chọn hơn. Như Pizza Hut cho ra mắt nhiều loại bánh mới, với đủ loại topping, cùng các món ăn kèm đa dạng. Hoặc như Lotteria có thêm menu cơm, mì ý, giúp khách hàng có nhiều sự lựa chọn hơn.</p>\n                    <p>Rõ ràng, thức ăn nhanh chính là món ăn tiện lợi và ngon miệng dành cho những người bận rộn hoặc muốn thưởng thức món ăn khác lạ.</p>\n                    <h2><strong>4. Tác hại của thức ăn nhanh</strong></h2>\n                    <p>Như đã nói ở trên, lợi và hại luôn song hành với nhau. Dù thức ăn nhanh rất tiện lợi, thơm ngon nhưng những tác hại mà nó gây ra không hề nhỏ. Bởi bản chất của đồ ăn nhanh là chứa nhiều dầu mỡ, calo và chất béo xấu.</p>\n                    <p>Việc lạm dụng ăn quá nhiều thức ăn nhanh, khiến cơ thể không kịp tiêu hóa hết lượng calo nạp vào, sẽ gây ra các bệnh như béo phì, tiểu đường, huyết áp cao và nhiều bệnh lý khác.</p>\n                    <p>Đặc biệt, trẻ em nếu ăn nhiều đồ ăn nhanh sẽ dẫn đến tình trạng tăng cân không kiểm soát, ảnh hưởng đến sự phát triển của trẻ. Do đó, bạn cần cân nhắc kỹ trước khi lựa chọn đồ ăn nhanh, không nên ăn quá nhiều và cần phải kết hợp với lối sống lành mạnh.</p>\n                </div>\n            </div>\n        </div>\n    </div>\n</body>\n</html>\n', 'hotcoffee.png', 'Bài viết đã cập nhật về đồ ăn nhanh', 'Cập nhật thông tin mới về đồ ăn nhanh.', 'bai-viet-da-cap-nhat-do-an-nhanh', 0, NULL, NULL, b'1', '2024-08-28 09:21:44.000000', 3),
(10, '2024-09-03 11:49:36.000000', '2024-09-03 11:49:36.000000', 'Nội dung chi tiết của bài viết mẫu.', 'mcdonalds.png', 'Bài viết mẫu', 'Đây là một bài viết mẫu.', 'bai-viet-mau', 0, NULL, NULL, b'1', '2024-09-03 11:49:36.000000', 2),
(11, '2024-09-03 11:53:25.000000', '2024-09-03 11:53:25.000000', 'Bánh mì kẹp thịt với nhiều lựa chọn nhân ngon miệng.', 'starbucks.png', 'Bánh mì kẹp thịt', 'Bánh mì kẹp thịt ngon', 'banh-mi-kep-thit', 0, NULL, NULL, b'1', '2024-09-03 11:53:25.000000', 3),
(14, '2024-09-03 21:05:02.000000', '2024-09-03 21:05:02.000000', 'Khách hàng của các cửa hàng fastfood này chủ yếu là các bạn thanh thiếu niên, khi đã ăn quen họ luôn có cảm giác thèm các loại thức ăn này, vì fastfood là những thức ăn không mất thời gian chế biến, tiện dụng, có thể vừa ăn vừa tán chuyện, hương vị khá ngon, màu sắc hấp dẫn, cộng thêm nhiều chương trình quảng cáo trẻ trung hết sức bắt mắt và những hình thức khuyến mại dễ hợp lòng người, đã níu chân nhiều bạn trẻ mỗi khi đi qua các cửa hàng này.', 'zalo_last_screenshot.png', 'Thức ăn nhanh - tiện nhưng không lợi', 'Ăn đồ ăn nhanh đang là một xu hướng của giới trẻ tại các thành phố lớn, nhiều bạn trẻ cho rằng đây là phong cách ăn sành điệu, ', 'thuc-an-nhanh', 1, NULL, NULL, b'1', '2024-09-03 21:05:02.000000', 7),
(15, '2024-09-03 21:08:20.000000', '2024-09-03 21:08:20.000000', 'Fastfood hay đồ ăn nhanh như gà rán, xúc xích, pizza… được các bạn trẻ rất yêu thích vì sự tiện dụng, nhìn rất bắt mắt và hương vị hấp dẫn. Vậy thức ăn nhanh là gì và những loại đồ ăn nhanh nào được các bạn trẻ yêu thích nhất? Bạn hãy cùng Blog Sapo tìm hiểu tại bài viết sau nhé.', 'city-1252643_640 - Copy.png', 'Fastfood/ Thức ăn nhanh là gì? Các loại đồ ăn nhanh phổ biến hiện nay', 'Thức ăn nhanh hay Fastfood là tên gọi của những loại đồ ăn được chế biến nhanh chóng, được thưởng thức tại chỗ ngay lập tức hoặc gói mang về', 'thuc-an-nhanh-hien-nay', 1, NULL, NULL, b'1', '2024-09-03 21:08:20.000000', NULL),
(16, '2024-09-03 21:10:47.000000', '2024-09-03 21:10:47.000000', 'Detailed content of the.', 'spicygrillchickenburger.png', 'Sample ', 'This is a s.', 'sample-post', 0, NULL, NULL, b'1', '2024-09-03 21:10:47.000000', NULL),
(17, '2024-09-03 21:14:12.000000', '2024-09-03 21:14:12.000000', 'Nội dung bài viết...', 'chickenwings.png', 'Tên Bài Viết', 'Mô tả ngắn', 'slug-bai-viet', 0, NULL, NULL, b'1', '2024-09-03 21:14:12.000000', 2),
(19, '2024-09-03 21:25:18.000000', '2024-09-03 21:25:18.000000', 'Thức ăn nhanh hay Fastfood là tên gọi của những loại đồ ăn được chế biến nhanh chóng, được thưởng thức tại chỗ ngay lập tức hoặc gói mang về. Thông thường, đồ ăn nhanh được chế biến sẵn. Khi có khách tới mua, nhà hàng chỉ cần làm nóng hoặc chiên lại trong một vài phút là đã có thể phục vụ thực khách.', 'river-1590010_640.jpg', 'hức ăn nhanh - Fastfood là gì?', 'Các bạn trẻ cực kì yêu thích các món ăn nhanh. Theo thống kê của Viện thực phẩm, thanh thiếu niên đã chi 45% ', 'thuc-an-nhanh-la-gi', 2, NULL, NULL, b'1', '2024-09-03 21:25:18.000000', 2);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `instagram` varchar(255) DEFAULT NULL,
  `mobile` varchar(255) DEFAULT NULL,
  `twitter` varchar(255) DEFAULT NULL,
  `cuisine_type` varchar(255) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `num_rating` int(11) NOT NULL,
  `open` bit(1) NOT NULL,
  `opening_hours` varchar(255) DEFAULT NULL,
  `registration_date` datetime(6) DEFAULT NULL,
  `address_id` bigint(20) DEFAULT NULL,
  `owner_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`id`, `email`, `instagram`, `mobile`, `twitter`, `cuisine_type`, `description`, `name`, `num_rating`, `open`, `opening_hours`, `registration_date`, `address_id`, `owner_id`) VALUES
(1, 'phungtoan872@gmail.com', 'haha', '0375582856', 'haha', 'ok', 'restaurant food', 'kfc', 0, b'1', 'Mon-Sun: 9:00 AM - 9:00 PM', NULL, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `restaurant_images`
--

CREATE TABLE `restaurant_images` (
  `restaurant_id` bigint(20) NOT NULL,
  `images` varchar(1000) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant_images`
--

INSERT INTO `restaurant_images` (`restaurant_id`, `images`) VALUES
(1, 'http://res.cloudinary.com/dcpesbd8q/image/upload/v1722337779/zti4qallzosa0yncqaox.png'),
(1, 'http://res.cloudinary.com/dcpesbd8q/image/upload/v1722337793/zuhiwap4qcn1z39taasw.png'),
(1, 'http://res.cloudinary.com/dcpesbd8q/image/upload/v1722337798/xjkv8sfzi9gbqu3vlsdh.png');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id` bigint(20) NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `message` varchar(255) DEFAULT NULL,
  `rating` double NOT NULL,
  `customer_id` bigint(20) DEFAULT NULL,
  `restaurant_id` bigint(20) DEFAULT NULL,
  `is_verified` bit(1) NOT NULL,
  `food_id` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `topic`
--

CREATE TABLE `topic` (
  `id` bigint(20) NOT NULL,
  `description` text DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint(20) DEFAULT NULL,
  `slug` varchar(255) NOT NULL,
  `status` enum('ACTIVE','BLOCKED','INACTIVE') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `topic`
--

INSERT INTO `topic` (`id`, `description`, `name`, `parent_id`, `slug`, `status`) VALUES
(2, 'Giới thiệu về đồ ăn ', 'Món ăn mới ', NULL, 'ai', 'INACTIVE'),
(3, 'Chủ đề về đồ ăn mới nhất', 'Đồ ăn mới', NULL, 'do-an', 'ACTIVE'),
(6, 'không có gì ', 'tài lanh là giỏi', NULL, 'tai-anh', 'ACTIVE'),
(7, 'không có gì ', 'tài lanh ', NULL, 'tai-anh', 'INACTIVE');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` bigint(20) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `full_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `role` tinyint(4) DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `email`, `full_name`, `password`, `role`, `status`) VALUES
(1, 'phungtoan872@gmail.com', 'Phùng ngọc Toàn', '$2a$10$oYyUi/Z1C3jguLpA.k8HPeXki7rAP73/PJw.nAIDps9scNjNLdbuS', 1, NULL),
(2, 'phungtoan0712@gmail.com', 'tinhco', '$2a$10$Xg1BOhPQiPE.NETKEHoea.Zmw/zm0CpSLorrDW4Ci/UY4ThlBD.UG', 0, NULL),
(102, 'phungtoan2023@gmail.com', 'maytinh', '$2a$10$.ZxUA1WB71jOmItJ7qLWA.5.qr1VpP5y0jIZwtxZI0/jWARNBuNwy', 3, 0),
(103, 'phungtoan82@gmail.com', 'haha', '$2a$10$lYhaEN.hzgt.Kuw8XZgWjOu0PUKo6HkU/642D2kaDSDZgOuHQN/Jy', 0, 1),
(152, 'giacatluong@gamil.com', 'Gia Cát Lượng', '$2a$10$EGxLtrMUkfQhILgBn4.rHONzI3NHkwusbDjJvQPhuVhzZICSt6d1e', 1, 2),
(202, 'taomanhduc@gamil.comfe', 'Mạnh Đức Quynhfe', '$2a$10$PDCWjOFVYUPezcY3KMCSMuc03RCDqt5Xuueh8NmDOic315EPgf2Ju', 1, 1),
(252, 'taomanhduc@gamil.com', 'Mạnh Đức Quynh', '$2a$10$T5lQ6VVQQE6PDfWC9RqmWueV8camRwq3ZGYtlP6tqE1bbyoJAjcge', 2, 0),
(305, 'hoangtan12@gamil.com', 'Tần Thủy Hoàng', '$2a$10$Zfpi6gGi52j9sClJScnI/uA/ro96bLgWJ//7fYuwiPpNQXnS2hDOO', 0, 1),
(352, 'phungtoan8722@gmail.com', 'Gia cát lường·', '$2a$10$CGO.dmr510V2gJttyyEMz.Zgg7/JEYsFWDkC37xMgxoQhViynTLcu', 0, NULL),
(353, 'phungtoan87222@gmail.com', 'Gia cát cẩn', '$2a$10$XNyQ9M3bk2BEXmRumXnkmecWfMB5nshkj1YD9PdEF3LvgLFMinsPW', 0, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `user_id` bigint(20) NOT NULL,
  `addresses_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`user_id`, `addresses_id`) VALUES
(1, 5),
(1, 6),
(1, 7),
(1, 8),
(1, 9),
(1, 10),
(1, 11),
(1, 12),
(1, 13),
(1, 14),
(1, 16),
(1, 17),
(1, 18),
(1, 20),
(1, 23),
(1, 24),
(1, 25),
(1, 26),
(1, 27),
(1, 28),
(1, 29),
(1, 30),
(1, 31),
(1, 32),
(1, 33),
(1, 34),
(1, 35),
(1, 36),
(1, 37),
(1, 38),
(1, 39),
(1, 40),
(1, 41),
(1, 42),
(1, 43),
(1, 44),
(1, 46),
(1, 63),
(1, 74),
(1, 75),
(1, 76),
(1, 77),
(1, 78),
(1, 79),
(1, 80),
(1, 81),
(1, 82),
(1, 83),
(1, 84),
(1, 85),
(1, 86),
(1, 87),
(1, 89),
(1, 90),
(2, 2),
(2, 3),
(2, 4),
(2, 19),
(2, 21),
(2, 22),
(2, 47),
(2, 48),
(2, 49),
(2, 50),
(2, 51),
(2, 52),
(2, 53),
(2, 54),
(2, 55),
(2, 56),
(2, 57),
(2, 58),
(2, 59),
(2, 60),
(2, 61),
(2, 62),
(2, 64),
(2, 65),
(2, 66),
(2, 67),
(2, 68),
(2, 69),
(2, 70),
(2, 71),
(2, 72),
(2, 73),
(2, 88);

-- --------------------------------------------------------

--
-- Table structure for table `user_favorites`
--

CREATE TABLE `user_favorites` (
  `user_id` bigint(20) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `id` bigint(20) DEFAULT NULL,
  `images` varbinary(1000) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_favorites`
--

INSERT INTO `user_favorites` (`user_id`, `description`, `id`, `images`, `title`) VALUES
(2, 'restaurant food', 1, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000003770400000003740055687474703a2f2f7265732e636c6f7564696e6172792e636f6d2f6463706573626438712f696d6167652f75706c6f61642f76313732323333373737392f7a74693471616c6c7a6f736130796e6371616f782e706e67740055687474703a2f2f7265732e636c6f7564696e6172792e636f6d2f6463706573626438712f696d6167652f75706c6f61642f76313732323333373739332f7a7568697761703471636e317a333974616173772e706e67740055687474703a2f2f7265732e636c6f7564696e6172792e636f6d2f6463706573626438712f696d6167652f75706c6f61642f76313732323333373739382f786a6b763873667a69396762717533766c7364682e706e6778, 'kfc'),
(1, 'restaurant food', 1, 0xaced0005737200136a6176612e7574696c2e41727261794c6973747881d21d99c7619d03000149000473697a65787000000003770400000003740055687474703a2f2f7265732e636c6f7564696e6172792e636f6d2f6463706573626438712f696d6167652f75706c6f61642f76313732323333373737392f7a74693471616c6c7a6f736130796e6371616f782e706e67740055687474703a2f2f7265732e636c6f7564696e6172792e636f6d2f6463706573626438712f696d6167652f75706c6f61642f76313732323333373739332f7a7568697761703471636e317a333974616173772e706e67740055687474703a2f2f7265732e636c6f7564696e6172792e636f6d2f6463706573626438712f696d6167652f75706c6f61642f76313732323333373739382f786a6b763873667a69396762717533766c7364682e706e6778, 'kfc');

-- --------------------------------------------------------

--
-- Table structure for table `user_seq`
--

CREATE TABLE `user_seq` (
  `next_val` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `user_seq`
--

INSERT INTO `user_seq` (`next_val`) VALUES
(451);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `about`
--
ALTER TABLE `about`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `address`
--
ALTER TABLE `address`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_867x3yysb1f3jk41cv3vsoejj` (`customer_id`);

--
-- Indexes for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK1uobyhgl1wvgt1jpccia8xxs3` (`cart_id`),
  ADD KEY `FKcro8349ry4i72h81en8iw202g` (`food_id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKp6n44aqw5n74qc4f1d6eyqgha` (`restaurant_id`);

--
-- Indexes for table `contact_messages`
--
ALTER TABLE `contact_messages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `coupon`
--
ALTER TABLE `coupon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `events`
--
ALTER TABLE `events`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKdu9w0l07t470p611xhr92l0f2` (`restaurant_id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKom10i5yg0k6knc5oh4k7gc6jh` (`food_id`),
  ADD KEY `FK1uphh0glinnprjknyl68k1hw1` (`user_id`);

--
-- Indexes for table `food`
--
ALTER TABLE `food`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKd5jb57wcj3nomso10nhrit3dc` (`food_category_id`),
  ADD KEY `FKm9xrxt95wwp1r2s7andom1l1c` (`restaurant_id`);

--
-- Indexes for table `food_images`
--
ALTER TABLE `food_images`
  ADD KEY `FKjjjt9373et45vaj0mguo4pd2p` (`food_id`);

--
-- Indexes for table `food_ingredients`
--
ALTER TABLE `food_ingredients`
  ADD KEY `FKhy3t7b303ydmureccjf1qak2k` (`ingredients_id`),
  ADD KEY `FKnfwd9dp2aw8o8l4ftu39jmvv9` (`food_id`);

--
-- Indexes for table `food_ratings`
--
ALTER TABLE `food_ratings`
  ADD KEY `FK5ukxe7umdbb6c8u4r92td2ixa` (`food_id`);

--
-- Indexes for table `ingredients_item`
--
ALTER TABLE `ingredients_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKjb94f4rm414htlxd1mwhf56in` (`category_id`),
  ADD KEY `FKkokfv1la8uvwmow57uv6aeqnx` (`restaurant_id`);

--
-- Indexes for table `ingredient_category`
--
ALTER TABLE `ingredient_category`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKdx2hvej3t5hkiguy698n9covv` (`restaurant_id`);

--
-- Indexes for table `notification`
--
ALTER TABLE `notification`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKqnduwq6ix2pxx1add03905i1i` (`recipient_id`),
  ADD KEY `FKko0pfhpsis62gs8e88dhh7knf` (`restaurant_id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_haujdjk1ohmeixjhnhslchrp1` (`payment_id`),
  ADD KEY `FK14n2jkmoyhpimhracvcdy7sst` (`customer_id`),
  ADD KEY `FKbwhiubtkxf94knbm9oo55wdbm` (`delivery_address_id`),
  ADD KEY `FKi7hgjxhw21nei3xgpe4nnpenh` (`restaurant_id`);

--
-- Indexes for table `orders_items`
--
ALTER TABLE `orders_items`
  ADD UNIQUE KEY `UK_7qrg5pfgjon82yhgwfqrdijm5` (`items_id`),
  ADD KEY `FKij1wwgx6o198ubsx1oulpopem` (`order_id`);

--
-- Indexes for table `order_item`
--
ALTER TABLE `order_item`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK4fcv9bk14o2k04wghr09jmy3b` (`food_id`);

--
-- Indexes for table `password_reset_token`
--
ALTER TABLE `password_reset_token`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK5lwtbncug84d4ero33v3cfxvl` (`user_id`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `post`
--
ALTER TABLE `post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FK93o2xaw90541rp5xaf29hsgd2` (`created_by`),
  ADD KEY `FK73bhxq44je0gbdtvjmyorje99` (`updated_by`),
  ADD KEY `FKg8ln3nj8tjclai0nuvpw5s5uw` (`topic_id`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `UK_e5wptm5diypt91i1wpsa42h6x` (`owner_id`),
  ADD KEY `FK96q13p1ptpewvus590a8o83xt` (`address_id`);

--
-- Indexes for table `restaurant_images`
--
ALTER TABLE `restaurant_images`
  ADD KEY `FK810i11orew47qx1nrcwlh43jb` (`restaurant_id`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKrrkqlt8co52qjdj34nqv97xn4` (`customer_id`),
  ADD KEY `FK70ry7cuti298yxet366rynxch` (`restaurant_id`),
  ADD KEY `FKch98c43t8o90hy3rj4qmihf0c` (`food_id`);

--
-- Indexes for table `topic`
--
ALTER TABLE `topic`
  ADD PRIMARY KEY (`id`),
  ADD KEY `FKipo6144dvb6o1rb1rgo88ut4d` (`parent_id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD UNIQUE KEY `UK_i5lp1fvgfvsplfqwu4ovwpnxs` (`addresses_id`),
  ADD KEY `FKfm6x520mag23hvgr1oshaut8b` (`user_id`);

--
-- Indexes for table `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD KEY `FK848qdyqh37xmekek29npyyjuo` (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `about`
--
ALTER TABLE `about`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `address`
--
ALTER TABLE `address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=91;

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `cart_item`
--
ALTER TABLE `cart_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=97;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `contact_messages`
--
ALTER TABLE `contact_messages`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT for table `coupon`
--
ALTER TABLE `coupon`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=80;

--
-- AUTO_INCREMENT for table `food`
--
ALTER TABLE `food`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `notification`
--
ALTER TABLE `notification`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=89;

--
-- AUTO_INCREMENT for table `order_item`
--
ALTER TABLE `order_item`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=129;

--
-- AUTO_INCREMENT for table `password_reset_token`
--
ALTER TABLE `password_reset_token`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `post`
--
ALTER TABLE `post`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `restaurant`
--
ALTER TABLE `restaurant`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `topic`
--
ALTER TABLE `topic`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `cart`
--
ALTER TABLE `cart`
  ADD CONSTRAINT `FK9mocisyryuqas1xrlbl8872lb` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `cart_item`
--
ALTER TABLE `cart_item`
  ADD CONSTRAINT `FK1uobyhgl1wvgt1jpccia8xxs3` FOREIGN KEY (`cart_id`) REFERENCES `cart` (`id`),
  ADD CONSTRAINT `FKcro8349ry4i72h81en8iw202g` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`);

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `FKp6n44aqw5n74qc4f1d6eyqgha` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`);

--
-- Constraints for table `events`
--
ALTER TABLE `events`
  ADD CONSTRAINT `FKdu9w0l07t470p611xhr92l0f2` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`);

--
-- Constraints for table `favorites`
--
ALTER TABLE `favorites`
  ADD CONSTRAINT `FK1uphh0glinnprjknyl68k1hw1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKom10i5yg0k6knc5oh4k7gc6jh` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`);

--
-- Constraints for table `food`
--
ALTER TABLE `food`
  ADD CONSTRAINT `FKd5jb57wcj3nomso10nhrit3dc` FOREIGN KEY (`food_category_id`) REFERENCES `category` (`id`),
  ADD CONSTRAINT `FKm9xrxt95wwp1r2s7andom1l1c` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`);

--
-- Constraints for table `food_images`
--
ALTER TABLE `food_images`
  ADD CONSTRAINT `FKjjjt9373et45vaj0mguo4pd2p` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`);

--
-- Constraints for table `food_ingredients`
--
ALTER TABLE `food_ingredients`
  ADD CONSTRAINT `FKhy3t7b303ydmureccjf1qak2k` FOREIGN KEY (`ingredients_id`) REFERENCES `ingredients_item` (`id`),
  ADD CONSTRAINT `FKnfwd9dp2aw8o8l4ftu39jmvv9` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`);

--
-- Constraints for table `food_ratings`
--
ALTER TABLE `food_ratings`
  ADD CONSTRAINT `FK5ukxe7umdbb6c8u4r92td2ixa` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`);

--
-- Constraints for table `ingredients_item`
--
ALTER TABLE `ingredients_item`
  ADD CONSTRAINT `FKjb94f4rm414htlxd1mwhf56in` FOREIGN KEY (`category_id`) REFERENCES `ingredient_category` (`id`),
  ADD CONSTRAINT `FKkokfv1la8uvwmow57uv6aeqnx` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`);

--
-- Constraints for table `ingredient_category`
--
ALTER TABLE `ingredient_category`
  ADD CONSTRAINT `FKdx2hvej3t5hkiguy698n9covv` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`);

--
-- Constraints for table `notification`
--
ALTER TABLE `notification`
  ADD CONSTRAINT `FKko0pfhpsis62gs8e88dhh7knf` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`),
  ADD CONSTRAINT `FKqnduwq6ix2pxx1add03905i1i` FOREIGN KEY (`recipient_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `FK14n2jkmoyhpimhracvcdy7sst` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKag8ppnkjvx255gj7lm3m18wkj` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`id`),
  ADD CONSTRAINT `FKbwhiubtkxf94knbm9oo55wdbm` FOREIGN KEY (`delivery_address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `FKi7hgjxhw21nei3xgpe4nnpenh` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`);

--
-- Constraints for table `orders_items`
--
ALTER TABLE `orders_items`
  ADD CONSTRAINT `FKij1wwgx6o198ubsx1oulpopem` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `FKl3w3fx5rbjq0tbb2i0xidwabh` FOREIGN KEY (`items_id`) REFERENCES `order_item` (`id`);

--
-- Constraints for table `order_item`
--
ALTER TABLE `order_item`
  ADD CONSTRAINT `FK4fcv9bk14o2k04wghr09jmy3b` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `password_reset_token`
--
ALTER TABLE `password_reset_token`
  ADD CONSTRAINT `FK5lwtbncug84d4ero33v3cfxvl` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `post`
--
ALTER TABLE `post`
  ADD CONSTRAINT `FKg8ln3nj8tjclai0nuvpw5s5uw` FOREIGN KEY (`topic_id`) REFERENCES `topic` (`id`);

--
-- Constraints for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD CONSTRAINT `FK96q13p1ptpewvus590a8o83xt` FOREIGN KEY (`address_id`) REFERENCES `address` (`id`),
  ADD CONSTRAINT `FKnm7kj0jgjep1nm5rslxei79jl` FOREIGN KEY (`owner_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `restaurant_images`
--
ALTER TABLE `restaurant_images`
  ADD CONSTRAINT `FK810i11orew47qx1nrcwlh43jb` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `FK70ry7cuti298yxet366rynxch` FOREIGN KEY (`restaurant_id`) REFERENCES `restaurant` (`id`),
  ADD CONSTRAINT `FKch98c43t8o90hy3rj4qmihf0c` FOREIGN KEY (`food_id`) REFERENCES `food` (`id`),
  ADD CONSTRAINT `FKrrkqlt8co52qjdj34nqv97xn4` FOREIGN KEY (`customer_id`) REFERENCES `user` (`id`);

--
-- Constraints for table `topic`
--
ALTER TABLE `topic`
  ADD CONSTRAINT `FKipo6144dvb6o1rb1rgo88ut4d` FOREIGN KEY (`parent_id`) REFERENCES `topic` (`id`);

--
-- Constraints for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD CONSTRAINT `FKfm6x520mag23hvgr1oshaut8b` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`),
  ADD CONSTRAINT `FKth1icmttmhhorb9wiarm73i06` FOREIGN KEY (`addresses_id`) REFERENCES `address` (`id`);

--
-- Constraints for table `user_favorites`
--
ALTER TABLE `user_favorites`
  ADD CONSTRAINT `FK848qdyqh37xmekek29npyyjuo` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
