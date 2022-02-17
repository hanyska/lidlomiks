import {Component, EventEmitter, Input, Output} from '@angular/core';

@Component({
  selector: 'app-icon-circle-button',
  template: `
    <button class="btn btn-circle {{color}}" (click)="onClick();$event.preventDefault()">
      <ng-content></ng-content>
    </button>
  `,
  styles: [
    `
      .btn-circle {
        width: 48px;
        height: 48px;
        padding: 10px 0;
        border-radius: 35px;
        text-align: center;
        font-size: 18px;
      }
    `
  ],
})
export class IconCircleButtonComponent {
  @Input() color = 'btn-ldx-primary';
  @Output() click: EventEmitter<boolean> = new EventEmitter<boolean>();

  constructor() { }

  ngOnInit(): void {
  }

  onClick() {
    this.click.emit(true);
  }

}
