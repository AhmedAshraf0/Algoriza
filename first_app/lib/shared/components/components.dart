import 'package:first_app/shared/cubit/cubit.dart';
import 'package:flutter/material.dart';

Widget DefaultButton({
  double width = double.infinity , radius = 0.0,
  Color color = Colors.blue,
  @required Function function,
  @required String text,
}) => Container(
  width: width,
  decoration: BoxDecoration(
    borderRadius: BorderRadius.circular(radius),
    color: color,
  ),
  child: MaterialButton(
    onPressed: function,
    child: Text(
      text,
      style: TextStyle(
        color: Colors.white,
      ),
    ),
  ),
);

Widget DefaultTextFormField({
  @required TextEditingController controller,
  @required String labelText,
  @required InputBorder inputBorder,
  @required IconData prefixIcon,
  IconData suffixIcon,
  bool check = false,
  TextInputType textInputType,
  Function function1,
  Function function2,
  Function onTapFunction,
  bool isClickable = true,
  @required Function validateFunction,
}) => TextFormField(
  controller: controller,
  decoration: InputDecoration(
    labelText: labelText,
    labelStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    border: inputBorder,
    prefixIcon: Icon(prefixIcon),
    suffixIcon: Icon(suffixIcon)
  ),
  keyboardType: textInputType,
  onFieldSubmitted: function1,
  onChanged: function2,
  validator: validateFunction,
  onTap: onTapFunction,
  enabled: isClickable,
  obscureText: check,
);

Widget BuildTaskItem(Map model , context) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 45.0,
        child: Text(
            '${model['time']}'
        ),
      ),
      SizedBox(
        width: 20.0,
      ),
      Expanded(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${model['title']}',
              style: TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            Text(
              '${model['data']}',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      ),
      SizedBox(
        width: 20.0,
      ),
      IconButton(
        onPressed: ()
        {
          AppCubit.get(context).updateData(status: 'done', id: model['id'],);
        },
        icon: Icon(
          Icons.check_box,
          color: Colors.green,
        ),
      ),
      IconButton(
        onPressed: ()
        {
          AppCubit.get(context).updateData(status: 'archived', id: model['id'],);
        },
        icon: Icon(
          Icons.archive,
          color: Colors.black45,
        ),
      ),
    ],
  ),
);