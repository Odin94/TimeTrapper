defmodule TimeTrapperWeb.TimeEntryController do
  use TimeTrapperWeb, :controller

  alias TimeTrapper.TimeTracking
  alias TimeTrapper.TimeTracking.TimeEntry

  def index(conn, _params) do
    time_entries = TimeTracking.list_time_entries()
    render(conn, "index.html", time_entries: time_entries)
  end

  def new(conn, _params) do
    changeset = TimeTracking.change_time_entry(%TimeEntry{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"time_entry" => time_entry_params}) do
    case TimeTracking.create_time_entry(time_entry_params) do
      {:ok, time_entry} ->
        conn
        |> put_flash(:info, "Time entry created successfully.")
        |> redirect(to: Routes.time_entry_path(conn, :show, time_entry))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    time_entry = TimeTracking.get_time_entry!(id)
    render(conn, "show.html", time_entry: time_entry)
  end

  def edit(conn, %{"id" => id}) do
    time_entry = TimeTracking.get_time_entry!(id)
    changeset = TimeTracking.change_time_entry(time_entry)
    render(conn, "edit.html", time_entry: time_entry, changeset: changeset)
  end

  def update(conn, %{"id" => id, "time_entry" => time_entry_params}) do
    time_entry = TimeTracking.get_time_entry!(id)

    case TimeTracking.update_time_entry(time_entry, time_entry_params) do
      {:ok, time_entry} ->
        conn
        |> put_flash(:info, "Time entry updated successfully.")
        |> redirect(to: Routes.time_entry_path(conn, :show, time_entry))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", time_entry: time_entry, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    time_entry = TimeTracking.get_time_entry!(id)
    {:ok, _time_entry} = TimeTracking.delete_time_entry(time_entry)

    conn
    |> put_flash(:info, "Time entry deleted successfully.")
    |> redirect(to: Routes.time_entry_path(conn, :index))
  end
end
