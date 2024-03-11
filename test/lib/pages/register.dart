import 'package:flutter/material.dart';
import 'package:template/components/UI/Btn.dart';
import 'package:template/components/UI/Input.dart';
import 'package:template/components/UI/Text/index.dart';
import 'package:template/components/UI/TextLink.dart';
import 'package:template/constants/colors.dart';
import 'package:template/extensions/store.dart';
import 'package:template/hooks/fetchData.dart';
import 'package:template/hooks/classes/Validator.dart';
import 'package:template/layouts/auth.dart';
import 'package:template/layouts/loading.dart';
import 'package:template/store/slices/account/actions.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:template/utils/functions/checkAuth.dart';

/*
  Register Screen ----------------
 */
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

/*
  State Screen ----------------
 */
class RegisterScreenState extends State<RegisterScreen> {
  // Variables ----------------
  final TextEditingController nameValue = TextEditingController();
  final TextEditingController emailValue = TextEditingController();
  final TextEditingController passwordValue = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String error = '';
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    checkAuth(context, (value) {
      setState(() {
        isLoading = value;
      });
    });
  }

  /*
    Methods ----------------
   */
  void onRegister(BuildContext context) async {
    // Проверка валидации формы
    if (formKey.currentState!.validate()) {
      // Dto
      final dto = {
        'first_name': nameValue.text,
        'email': emailValue.text,
        'password': passwordValue.text,
      };

      try {
        // Отправляем запрос
        final data = await fetchData(
          '/account/register',
          method: 'POST',
          body: dto,
        );

        // Сохраняем токен авторизации
        final prefs = await SharedPreferences.getInstance();
        await prefs.setString('auth_token', data['token']);

        // Сохраняем данные пользователя в хранилище
        context.store.dispatch(AddUserData(data));

        // Перенаправляем пользователя
        Navigator.pushNamed(context, '/home');
      } catch (err) {
        // Сохраняем ошибки
        setState(() {
          error = err.toString();
        });
      }
    }
  }

  // Builder ----------------
  @override
  Widget build(BuildContext context) {
    // Если загрузка
    if (isLoading) {
      return const LoadingLayout();
    }

    // Если нет загрузки
    else {
      return AuthLayout(
          Form(
            key: formKey,
            child: Column(
              children: [
                // Ошибки запроса
                if (error.isNotEmpty)
                  Transform.translate(
                    offset: const Offset(0, -20),
                    child: CText(error, size: 14, color: AppColors.red),
                  ),
                Input(
                  'Имя',
                  nameValue,
                  validator: (value) => Validator.required(context, value),
                ),
                const SizedBox(height: 15),
                Input(
                  'E-mail',
                  emailValue,
                  textType: TextInputType.emailAddress,
                  validator: Validator.validate(context, [
                    Validator.required,
                    Validator.email,
                  ]),
                ),
                const SizedBox(height: 15),
                Input('Пароль', passwordValue,
                    type: InputType.password,
                    validator: (value) => Validator.min(context, value, 6)),
                const TextLink('У меня уже есть аккаунт', link: '/login'),
                const SizedBox(height: 25),
                Btn('Зарегистрироваться', () => onRegister(context)),
              ],
            ),
          ),
          text: const [CText('Создать аккаунт', size: 20)]);
    }
  }

  // Dispose ----------------
  @override
  void dispose() {
    nameValue.dispose();
    emailValue.dispose();
    passwordValue.dispose();
    super.dispose();
  }
}
