
import '../../../../export.dart';

class Dice extends StatefulWidget {
  const Dice({Key? key}) : super(key: key);

  @override
  State<Dice> createState() => _DiceState();
}

class _DiceState extends State<Dice> {
  Random random =  Random();
  int currentImageIndex = 0;
  int counter = 1;
  int points = 0 ;
  List<String> images = [
   'lib/assets/dice_1.png' ,
    'lib/assets/dice_2.png',
    'lib/assets/dice_3.png',
    'lib/assets/dice_4.png',
    'lib/assets/dice_5.png',
    'lib/assets/dice_6.png',
  ];
  AudioPlayer player = AudioPlayer();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff15202B),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xff15202B),
        title: const Text('Dice Roll', style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Transform.rotate(
                angle: random.nextDouble() * 180,
                child: GestureDetector(
                  onTap: ()async{
                    // Rolling the dice
                    // Sound
               //    await  player.setUrl( 'http://zt.999087.com/app/free/tz.mp3');    
               // await  player.setAsset('lib/assets/tz.mp3');
                //    player.play();


                    // Roll the dice
                    Timer.periodic(const Duration(milliseconds: 80), (timer) {
                      counter++;
                      setState(() {
                        currentImageIndex = random.nextInt(6);
                        points = (currentImageIndex+1)*10;
                      });

                      if (counter >= 14) {
                        timer.cancel();
                        setState(() {
                          counter = 1;
                        });
                      }
                    });

                  },
                  child: Image.asset(
                      images[currentImageIndex],
                      height: 200,
                      width: 200,
                      fit: BoxFit.fill  ,
                  ),
                ),
              ),
              SizedBox(height: 45,),
              Text("${points}", style: TextStyle(color: Colors.white,fontSize: 50, fontWeight: FontWeight.bold),)
            ],
          )
      ),
    );
  }

}