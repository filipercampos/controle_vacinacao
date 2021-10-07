import 'package:controle_vacinacao/app/constants/app_colors.dart';
import 'package:controle_vacinacao/app/modules/control/models/vaccine.dart';
import 'package:controle_vacinacao/app/shared/extensions/date_extension.dart';
import 'package:flutter/material.dart';

class HistoriyTile extends StatelessWidget {
  final Vaccine vaccine;
  const HistoriyTile(this.vaccine, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.5),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(top: 8, left: 12),
            child: Text(
              '${vaccine.disease} ${vaccine.name}',
              overflow: TextOverflow.clip,
              style: TextStyle(
                color: primaryColorDark,
                fontSize: 18,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Container(
            height: 80,
            margin: EdgeInsets.all(8),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: vaccine.doses.length,
              itemBuilder: (_, index) {
                final dose = vaccine.doses[index];
                return Container(
                  margin: EdgeInsets.all(5),
                  padding: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    border: Border.all(color: primaryColor, width: 0.5),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          dose.name,
                          style: TextStyle(
                            color: primaryColorDark,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 2),
                      Container(
                        child: Text('${DateTime.now().toFormat()}'),
                      ),
                      Container(
                        child: Text(
                          dose.name,//dosagem
                          style: TextStyle(),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
