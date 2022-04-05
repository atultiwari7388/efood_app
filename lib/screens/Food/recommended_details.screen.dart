import 'package:ecom_app/utils/colors.utils.dart';
import 'package:ecom_app/utils/dimensions.utils.dart';
import 'package:ecom_app/widgets/custom_top_icon.widget.dart';
import 'package:ecom_app/widgets/expandable_text.widget.dart';
import 'package:ecom_app/widgets/large_text.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

class RecommendedProductDetailScreen extends StatelessWidget {
  const RecommendedProductDetailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          TopComponent(),
          SliverToBoxAdapter(
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                    // top: Dimensions.height10,
                  ),
                  child: ExpandableTextWidget(
                      text:
                          "textDiam sanctus rebum et sanctus no no. Justo et sit ipsum no vero dolore. Nonumy consetetur sit ea tempor amet ea diam. Labore sit dolore vero eirmod aliquyam nonumy diam. No sit et ipsum sadipscing ipsum amet at, duo et aliquyam consetetur elitr amet. Duo sed vero at lorem tempor sit kasd voluptua. Sed diam tempor diam ipsum eirmod. Takimata lorem amet eirmod takimata invidunt et, diam sanctus dolor no sit et dolores invidunt duo, eos ut et eos lorem dolores sit takimata clita aliquyam. Voluptua eirmod duo clita sed et erat dolor amet labore. Sed tempor et erat sed, magna diam sed ut nonumy dolore tempor, dolor sit lorem magna sea eos elitr dolor, ea no clita nonumy est. Et labore dolores accusam invidunt accusam est sed ea. Et diam consetetur ipsum ea, voluptua aliquyam aliquyam clita sanctus magna ea erat, aliquyam diam clita ipsum et lorem sadipscing diam. Gubergren sed clita sea stet clita elitr voluptua, lorem lorem nonumy duo nonumy consetetur amet, diam dolor consetetur lorem tempor, nonumy sadipscing duo dolor dolore. Lorem et amet nonumy labore kasd eirmod. Dolor aliquyam lorem rebum takimata sit elitr rebum dolor amet. Et kasd sit invidunt no sea stet. Ea elitr takimata amet ipsum kasd consetetur ipsum kasd, sanctus clita consetetur justo eos erat labore duo. Amet amet labore vero elitr lorem duo magna. No amet eirmod est eos clita vero vero clita et, amet clita takimata diam est accusam est dolore, lorem et consetetur et et sadipscing nonumy ipsum. Gubergren sit sed duo sit voluptua, dolor kasd et dolores lorem amet eos ipsum. Duo dolores sea dolore ea ipsum. Aliquyam sed dolores amet ea, at sit invidunt justo dolores accusam, nonumy diam vero justo diam invidunt rebum justo lorem, voluptua et lorem vero dolor sit invidunt accusam dolor. Clita vero dolor et diam. Diam eirmod dolor sed ut, sed gubergren dolor ipsum rebum at. Tempor et aliquyam sit takimata magna eos gubergren, diam lorem dolore takimata clita gubergren stet et magna, nonumy eos magna invidunt et no ipsum dolores dolor, stet eirmod magna et voluptua, vero et voluptua dolor ea duo labore et takimata kasd, gubergren labore erat dolor et accusam, sed kasd eirmod amet dolor elitr. Duo tempor diam et et sadipscing accusam justo. Amet sit dolor ipsum voluptua amet gubergren tempor, lorem no sadipscing dolores tempor elitr dolore accusam amet no. Stet sed amet dolor voluptua sadipscing clita gubergren tempor erat. Duo consetetur nonumy sadipscing sit takimata ipsum eirmod, eirmod eirmod lorem dolores magna amet. Sadipscing sed ea clita sed duo gubergren lorem sed. Et dolor dolor gubergren vero. Eirmod amet justo ut diam eirmod sed invidunt sed et. Diam duo ipsum erat dolor diam, clita no nonumy sed et. Et takimata sed ipsum lorem est. Ea vero magna takimata stet accusam. At takimata est dolor duo aliquyam magna elitr eos, et ipsum justo magna sed est sea sanctus sanctus takimata, nonumy justo ea kasd et eirmod rebum elitr lorem, accusam dolores justo diam ea lorem magna. Ut et amet kasd no invidunt clita sadipscing gubergren justo. Lorem dolore nonumy lorem accusam dolore magna duo. Labore duo sed dolore dolores vero. Elitr magna voluptua sed accusam vero gubergren diam. Ipsum dolore eos elitr sit diam, et vero voluptua lorem at dolores clita erat elitr, diam et elitr tempor no sed et ipsum amet tempor. Lorem et et et labore at est dolores dolores, duo sit et duo ipsum est elitr aliquyam diam eos. At magna magna duo amet sit sit lorem sed diam. Dolores dolores labore labore amet dolore dolores no erat, no gubergren kasd accusam diam et. Nonumy sit et amet justo sadipscing erat labore, elitr ea stet sed clita et nonumy et. Consetetur duo no vero magna dolore, nonumy amet justo sadipscing clita sanctus, no justo sed clita ut kasd justo consetetur ut. Ipsum sit sadipscing sadipscing justo, takimata ipsum ipsum ipsum lorem magna sed consetetur, vero duo sadipscing et lorem lorem justo voluptua amet duo. Stet clita magna consetetur aliquyam sed no. Dolore ipsum dolore takimata dolore dolore nonumy labore diam nonumy, ipsum duo diam diam nonumy ea labore erat sit et, dolor est ut diam sed et nonumy, sed elitr consetetur dolor nonumy et invidunt tempor. Gubergren diam et ipsum elitr, et sadipscing sadipscing dolore sed et. Et ipsum amet diam kasd dolor sadipscing, at sit clita nonumy nonumy kasd. Sadipscing dolor dolor justo sed consetetur et sit. Gubergren kasd dolor amet dolor. Eos sit sed accusam ea diam dolor rebum sea takimata. Gubergren elitr magna nonumy nonumy rebum ea. Sit erat ea."),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            padding: EdgeInsets.only(
              left: Dimensions.width20 * 2.5,
              right: Dimensions.width20 * 2.5,
              top: Dimensions.height10,
              bottom: Dimensions.height10,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppIcon(
                  icon: Icons.remove,
                  backgroundColor: Colors.green,
                  iconColor: Colors.white,
                ),
                CustomLargeText(text: "\₹${18}"),
                AppIcon(
                  icon: Icons.add,
                  backgroundColor: Colors.green,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(height: Dimensions.height10 / 2),
          Container(
            height: Dimensions.bottomHeightBar,
            padding: EdgeInsets.only(
              top: Dimensions.height30,
              bottom: Dimensions.height30,
              left: Dimensions.width20,
              right: Dimensions.width20,
            ),
            decoration: BoxDecoration(
              color: AppColors.buttonBackgroundColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(Dimensions.radius20 * 2),
                topRight: Radius.circular(Dimensions.radius20 * 2),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                //add and remove items
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.white,
                  ),
                  child: Icon(
                    IconlyBold.heart,
                    color: Colors.green,
                  ),
                ),
                // subTotal
                Container(
                  padding: EdgeInsets.only(
                    top: Dimensions.height20,
                    bottom: Dimensions.height20,
                    left: Dimensions.width20,
                    right: Dimensions.width20,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(Dimensions.radius20),
                    color: Colors.green.withOpacity(0.86),
                  ),
                  child: CustomLargeText(
                    text: "\₹${18} | Add to cart",
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TopComponent extends StatelessWidget {
  const TopComponent({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      pinned: true,
      expandedHeight: Dimensions.height300,
      backgroundColor: Colors.green,
      elevation: 1.0,
      toolbarHeight: Dimensions.height80,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          AppIcon(icon: IconlyLight.closeSquare),
          AppIcon(
            icon: IconlyLight.notification,
            iconColor: Colors.black,
          ),
        ],
      ),
      flexibleSpace: FlexibleSpaceBar(
        background: Image.network(
          "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fi.ytimg.com%2Fvi%2Fc_ZkvfLuCsE%2Fmaxresdefault.jpg&f=1&nofb=1",
          width: double.maxFinite,
          fit: BoxFit.cover,
        ),
      ),
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(Dimensions.height20),
        child: Container(
          padding: EdgeInsets.only(
            top: Dimensions.height5,
            bottom: Dimensions.height10,
          ),
          width: double.maxFinite,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(Dimensions.radius20),
              topRight: Radius.circular(Dimensions.radius20),
            ),
          ),
          child: Center(
            child: CustomLargeText(
              text: "Dehati Rasgulla",
              fontSize: Dimensions.font26,
            ),
          ),
        ),
      ),
    );
  }
}
