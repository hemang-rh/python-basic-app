import typer
from rich.console import Console
from rich.table import Table
from typing import Optional

app = typer.Typer()
console = Console()


@app.command()
def hello(name: str, count: Optional[int] = 1):
    """
    Say hello to someone multiple times
    """
    for _ in range(count):
        console.print(f"Hello [blue]{name}[/blue]! :wave:")


@app.command()
def show_tasks():
    """
    Display a sample task list
    """
    table = Table(title="Tasks")

    table.add_column("ID", justify="right", style="cyan")
    table.add_column("Task", style="magenta")
    table.add_column("Status", justify="center", style="green")

    table.add_row("1", "Write documentation", "Done")
    table.add_row("2", "Implement features", "In Progress")
    table.add_row("3", "Write tests", "Pending")

    console.print(table)


if __name__ == "__main__":
    app()
