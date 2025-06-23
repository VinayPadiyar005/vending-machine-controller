# 🥤 Vending Machine Controller (Verilog)

This project implements a simple Finite State Machine (FSM) based **Vending Machine Controller** in Verilog. It accepts ₹1 and ₹2 coins and dispenses a product costing ₹5. If the inserted amount exceeds ₹5, it returns the correct change.

---

## 📌 Features

- ✅ Designed using FSM (7 states from ₹0 to ₹6)
- ✅ Inputs: `coin_1` (₹1), `coin_2` (₹2)
- ✅ Outputs: `product` signal and 2-bit `change`
- ✅ Verified with simulation waveform
- ✅ Written in Verilog HDL and tested in Vivado

---

## 🧠 How It Works

| Coin Input Sequence     | Total Value | Output          |
|-------------------------|-------------|------------------|
| ₹1 → ₹2 → ₹2            | ₹5          | Product = ✅, Change = ₹0 |
| ₹2 → ₹2 → ₹2            | ₹6          | Product = ✅, Change = ₹1 |
| ₹1 × 5                  | ₹5          | Product = ✅, Change = ₹0 |

The machine resets after dispensing and is ready for the next customer.

---

## 🧪 Testbench Simulation

The project includes a complete testbench to verify functionality using coin insertion sequences.

```verilog
# Insert ₹2 + ₹2 + ₹2
# Expect: product = 1, change = 1
```

### ✅ Sample Waveform

![Waveform](waveform.png)

---

## 📂 Project Structure

```
vending-machine-fsm/
├── Vending_Machine_Controller.v        # FSM logic
├── tb_Vending_Machine_Controller.v     # Testbench
├── waveform.png                        # Simulation output
└── README.md                           # This file
```

---

## 🚰 Tools Used

- 💻 Xilinx Vivado
- 🧠 Verilog HDL
- 🧪 Testbench + Simulation (Behavioral)

---

## 🚀 Future Enhancements

- Add support for ₹5 or ₹10 coins
- Add product selection buttons
- Display balance and product codes on 7-segment
- Mealy vs Moore FSM comparison

---

## 👨‍💻 Author

Vinay Padiyar  
_Electronics & Communication Engineering Student | Digital Design Enthusiast_

---

## 📬 Contact

If you'd like to discuss digital design, VLSI, or Verilog projects, feel free to connect!

---

