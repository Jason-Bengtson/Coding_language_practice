import 'dart:math';
import 'dart:async';
import 'dart:html';

class Canvas {
  CanvasElement context; // Hunter's canvas element
  CanvasRenderingContext2D ctx;

  int height = 400;
  int width = 400;
}

void drawBall(Ball ball, Canvas canvas) {
// Clear display
  canvas.ctx.save();
  canvas.ctx.fillStyle = "#000000";
  canvas.ctx.fillRect(0, 0, canvas.width, canvas.height);
  canvas.ctx.restore();

// Update ball (with Physics! =)

// 1 - apply velocity to position (vx -> x)
  ball.x += ball.vx;
  ball.y += ball.vy;

// 2 - apply drag/friction to velocity
  ball.vx *= 1;
  ball.vy *= 1;
// 3 - apply gravity to velocity
  ball.vy += .5;
  ball.vx += .5;
// 4 - check for collisions
  if (ball.y + ball.r > canvas.height) {
    ball.y = canvas.height - ball.r;
    ball.vy = -ball.vx.abs();
  }
  if (ball.y + ball.r < 30) {
    ball.y = 0 + ball.r;
    ball.vy = ball.vx.abs();
  }
  if (ball.x + ball.r > canvas.width) {
//ball.x -= ball.vx;
    ball.x = canvas.width - ball.r;
    ball.vx = -ball.vx.abs();
  }
  if (ball.x + ball.r < 30) {
//ball.x -= ball.vx;
    ball.x = 0 + ball.r;
    ball.vx = ball.vx.abs();
  }

// Draw ball
  canvas.ctx.save();

  canvas.ctx.fillStyle = "#FFFFFF";
  canvas.ctx.beginPath();
  canvas.ctx.arc(ball.x, ball.y, ball.r, 0, pi * 2, true);
  canvas.ctx.closePath();
  canvas.ctx.fill();
  canvas.ctx.restore();

  const bounceTime = const Duration(milliseconds: 50);
  new Timer(bounceTime, () => drawBall(ball, canvas));
}
//class onMouseDown {
//}

class Ball {
  double x = 100;
  double y = 200;
  double r = 15;
  double vx = 0;
  double vy = 0;
}

// class Point {
//   final int x;
//   final int y;
//   Point(this.x, this.y);
// }

void main() {
  var canvas = new Canvas();
  var ball = new Ball();

//   Point clientBoundingRect;
//   Future<html.ElementRect> futureRect = canvas.context.rect;
//   futureRect.then((html.ElementRect rect) {
//     clientBoundingRect = new Point(rect.bounding.left, rect.bounding.top);
//   });
//   Point getXandY(e) {
//     num x = e.clientX - clientBoundingRect.x;
//     num y = e.clientY - clientBoundingRect.y;
//     return new Point(x, y);
//   }

//   canvas.context.on.click.add((e) {
//     click = getXandY(e);
//   });

  canvas.context = querySelector('#canvas');

  //querySelector('#canvas').onClick.listen((MouseEvent me) {
  //  drawBall(ball, canvas);
  //});
  //canvas.context.onClick.listen(doMouseDown);
  canvas.ctx = canvas.context.getContext('2d');
  //drawBall(ball, canvas);
  canvas.context.onClick.listen((MouseEvent me){drawBall(ball, canvas);});
}