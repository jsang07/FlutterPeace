import 'package:flutter/material.dart';
import 'dart:math';
import 'package:show_up_animation/show_up_animation.dart';

class randomCard extends StatefulWidget {
  const randomCard({Key? key}) : super(key: key);

  @override
  State<randomCard> createState() => _randomCardState();
}

class _randomCardState extends State<randomCard> {
  int imageNumber = 1;
  bool imageVisible = false;
  bool _visibility = true;
  bool _isLoading = true;

  @override
  Widget build(BuildContext context) {
    var links = [
      'https://postfiles.pstatic.net/MjAyMzAyMjFfMjIy/MDAxNjc2OTYzNDcwMjk3.rsJ9ZgSL4EMLDz5uKHtv1G7pXz9qD3yIhYQyBN7UiEsg.Y06EzM7crOe6Beu7GZrZonf0kYs0s2QaU24eU6rNNE8g.PNG.umm0714/pic1.png?type=w966',
      'https://postfiles.pstatic.net/MjAyMzAyMjFfNzIg/MDAxNjc2OTYzNDcwNDk1.cm_RYnC5Q39lBCgwibSLSUq_BMV4odc_3QuifJGSPtUg.-z4oNgaaQs3qPOR3RyoKE0b1rz275o4yzhBIao2h2-wg.PNG.umm0714/pic2.png?type=w966',
      'https://postfiles.pstatic.net/MjAyMzAyMjFfMzEg/MDAxNjc2OTYzNDcwNDc4.zrey57legNGVjWnLgkD9ii8BJCPcsb88G0kRU_jDGxQg.KGlE3bnM0eF-VgNlJvY7ipdcm9eJLXRfyogC9BxQIOAg.PNG.umm0714/pic3.png?type=w966',
      'https://postfiles.pstatic.net/MjAyMzAyMjFfMjMy/MDAxNjc2OTYzNDcwNTI4.UY2SEvYpKmVXTZGObTJ62XwnFnTZpiysaAR1PXr1BzMg.CpEjZgMsDmp8lRryks_FDzh-t6N57SMGP1hPyoo2cM8g.PNG.umm0714/pic4.png?type=w966',
      'https://postfiles.pstatic.net/MjAyMzAyMjFfMzAg/MDAxNjc2OTYzNDcwNzk5.XLllF6xGG8-IxVulNyTsrO6c0LMilv6Ia8uPkE86gAEg.0ff4F8ZUXY6P5e0EmLrOmjIZuHWJdpJUdAtMZfmOWnAg.PNG.umm0714/pic5.png?type=w966',
      'https://postfiles.pstatic.net/MjAyMzAyMjFfNjkg/MDAxNjc2OTYzNDcwODQ5.uhFNh8V5LMqs73nkjxdY3GcjBLMGMQuNscM_Vu5dRkwg.PfdkKtfgxiFr5ecj0Ii9O1ji5NlbR_PbSrQOgSvpppkg.PNG.umm0714/pic6.png?type=w966',
      'https://postfiles.pstatic.net/MjAyMzAyMjFfNTAg/MDAxNjc2OTYzNDcwODYy.q63GLPeXw_o0jrH__bpmdhst0AiZDOZZ53FeaKIXEy8g.T7PwONF_23vp-pQQ78Q-ZxbFe2XVwx19HmwW6po0Z1Ug.PNG.umm0714/pic7.png?type=w966',
      'https://postfiles.pstatic.net/MjAyMzAyMjFfMjIg/MDAxNjc2OTYzNDcwOTM5.MbMuMH26O4-6qs7xVAX9bMWEXygyAOBOD2TRtMqCwFkg.9gXkaNyCdz35MmewSK7FUEmRlg1jBb-ShrVB9wV9VUgg.PNG.umm0714/pic8.png?type=w966',
      'https://postfiles.pstatic.net/MjAyMzAyMjFfMjc3/MDAxNjc2OTYzNDcxMDY0.QMipQUZKL7K2nyQpwwoMTa0-OLGdP8ShQZY0APV7Kgcg.EpeHdAJC9v9mTNCogQ8IKB0PZNhbg7Ji2a4w1x5FCtUg.PNG.umm0714/pic9.png?type=w966',
      'https://postfiles.pstatic.net/MjAyMzAyMjFfMjc3/MDAxNjc2OTYzNDcxMDE0.BqPBEHAlTCFCb-MbC2h50vXHXN0UA_-5btQ04RQ-eAog.6Fz-DC5ZeH3um-pHyz2j8IECOcTF7cdoRvALF2Uj9PYg.PNG.umm0714/pic10.png?type=w966',
      'https://postfiles.pstatic.net/MjAyMzAyMjFfMTI1/MDAxNjc2OTYzNDcxMjc2.nNZoyBT67q0K29m4h54qqhgXoiUKtzu2flyYajLOxcUg.v2-3Il_d9pw5yMLFvM069lP2ms3h38JrrKaE8lj8D8kg.PNG.umm0714/pic11.png?type=w966',
      'https://postfiles.pstatic.net/MjAyMzAyMjFfMjg1/MDAxNjc2OTYzNDcxMzQ3.pObKjRFpxEr-JvqkiKlXNmzKGGJ5UirSNPtttTirxgYg.76uUd-1J3P6u4jmZw-eXGhXC2YOvg0LCcTD81LKbtnYg.PNG.umm0714/pic12.png?type=w966',
      'https://postfiles.pstatic.net/MjAyMzAyMjFfNjUg/MDAxNjc2OTYzNDcxMzIw.KkwJ0wqLkA4DWRpS5DeVD0a1WSrqK-ZKsqHvQjwrU7Ug.YCsDIkSbsZhiJcKlnX_PX5o-DtwfiMGm2C6pesChSP4g.PNG.umm0714/pic13.png?type=w966',
      'https://postfiles.pstatic.net/MjAyMzAyMjFfMTU4/MDAxNjc2OTYzNDcxNDYw.ZJjPoN0kdPJcHnHwqe3cKt5Hw6ITQrwtlkDZg-UMd9og.rCfEDntwJ-EI7FibiasFNeqTNgn6NOEOskO57QxILR4g.PNG.umm0714/pic14.png?type=w966',
      'https://postfiles.pstatic.net/MjAyMzAyMjFfMjg2/MDAxNjc2OTYzNDcxNDk5.wZ2Zcx39UqtNnixS-8nlfn5E_3FMa_ZHJ5qlBzh01ggg.994Osqx_kTxeBclXI7-46Kqo48Z851O6qDre76cZoNEg.PNG.umm0714/pic15.png?type=w966',
      'https://postfiles.pstatic.net/MjAyMzAyMjFfODMg/MDAxNjc2OTYzNDcxNjYw.n9w8oK9TpDZ1-BeYIiYOdxKOul-LlcgNA9kM1KRBLIQg.y9_i4U_S4YXjQSpaqEg3G36-dEIMPIMyp-ktzFznqC4g.PNG.umm0714/pic16.png?type=w966',
    ];
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0.5,
        title: Text(
          '오늘의 글귀',
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          Icon(Icons.image),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: imageVisible,
              child: ShowUpAnimation(
                  delayStart: Duration(milliseconds: 800),
                  animationDuration: Duration(milliseconds: 600),
                  curve: Curves.slowMiddle,
                  offset: 0.1,
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 0),
                    child: ClipRRect(
                        borderRadius: BorderRadius.all(Radius.circular(40)),
                        child: Image.network(
                          links[imageNumber],
                          height: height * 0.55,
                          loadingBuilder: (context, child, loadingProgress) {
                            if (loadingProgress == null) {
                              _isLoading = false;
                              return child;
                            } else {
                              return Center(
                                child: SizedBox(
                                    child: CircularProgressIndicator()),
                              );
                            }
                          },
                        )),
                  )),
            ),
            Visibility(
                visible: _visibility,
                child: InkWell(
                  onTap: () {
                    setState(() {
                      imageNumber = Random().nextInt(16);
                    });
                    _visibility = false;
                    imageVisible = true;
                  },
                  child: Container(
                      width: width * 0.3,
                      height: height * 0.053,
                      decoration: const BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.all(Radius.circular(20)),
                          boxShadow: [
                            BoxShadow(blurRadius: 2, color: Colors.grey)
                          ]),
                      child: Center(
                          child: Text(
                        '오늘의 글귀',
                        style: TextStyle(
                            color: Colors.white, fontSize: width * 0.045),
                      ))),
                )),
          ],
        ),
      ),
    );
  }
}
